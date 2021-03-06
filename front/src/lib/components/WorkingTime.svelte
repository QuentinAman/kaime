<script context="module">
	export const toString = (d = new Date()) => {
		const s = (n = 0) => n.toString().padStart(2, '0');

		const yyyy = s(d.getFullYear());
		const mm = s(d.getMonth() + 1);
		const dd = s(d.getDate());

		const hours = s(d.getHours());
		const minutes = s(d.getMinutes());

		return `${yyyy}-${mm}-${dd}T${hours}:${minutes}`;
	};
</script>

<script>
	import { scale } from 'svelte/transition';
	import { expoOut } from 'svelte/easing';
	import { spring } from 'svelte/motion';
	import { drag, outside, contextmenu } from '../actions';
	import Icon from './Icon.svelte';
	import { createEventDispatcher, onDestroy } from 'svelte';
	import { createDelayer } from '$lib/functions';

	const dispatch = createEventDispatcher();

	/**
	 * @type {{
	 * 	id: any
	 *  start: string
	 *  end: string
	 *  description: string
	 * }}
	 */
	export let data;
	export let date = new Date();
	export let left = '0';

	const start = date.setHours(0, 0, 0, 0);
	const end = date.setDate(date.getDate() + 1);

	const max = end - start;
	const { delay, clear } = createDelayer(1000);

	let menu = null;

	/**
	 * @param {number} y
	 * @param {keyof typeof data} prop
	 */
	const diffProp = (y, prop) => {
		const rect = container.parentElement.getBoundingClientRect();
		const percent = (y - rect.y) / rect.height;

		// update();

		data[prop] = toString(new Date(max * percent + start));
	};

	const update = () => {
		delay(() => dispatch('update'));
	};

	/** @type {HTMLElement} */
	let container;
	let dragging = false;
	let pos = spring({ x: 0, y: 0 }, { damping: 0.25, stiffness: 0.1 });

	$: top = (Date.parse(data.start) - start) / max;
	$: bottom = (end - Date.parse(data.end)) / max;

	onDestroy(clear);
</script>

{#if menu}
	<ul
		transition:scale={{ easing: expoOut }}
		use:outside={() => (menu = null)}
		class="menu"
		style="left: {menu.x}px; top: {menu.y}px;"
	>
		<li on:mousedown={() => dispatch('delete')}><Icon name="Cross" /> Supprimer</li>
	</ul>
{/if}

<div
	transition:scale
	bind:this={container}
	use:contextmenu={(e) => {
		e.preventDefault();
		menu = {
			x: e.clientX,
			y: e.clientY
		};
	}}
	class="container"
	style="top: {top * 100}%; bottom: {bottom * 100}%; left: {left};"
>
	<div
		class="handle top"
		use:drag={(e) => {
			diffProp(e.y, 'start');
			return () => dispatch('update');
		}}
	/>
	<div
		class="content"
		use:drag={(e) => {
			diffProp(e.y - e.offsetY.top, 'start');
			diffProp(e.y - e.offsetY.bottom, 'end');
			dragging = true;
			$pos = { x: e.x, y: e.y };

			return () => {
				dispatch('update');
				dragging = false;
			};
		}}
	>
		<p class="time">{data.start.match(/\d{2}:\d{2}/)}</p>
		<p class="description" contenteditable bind:textContent={data.description} on:input={update} />
	</div>
	<div
		class="handle bottom"
		use:drag={(e) => {
			diffProp(e.y, 'end');
			dragging = true;
			$pos = { x: e.x, y: e.y };
			return () => {
				dragging = false;
				dispatch('update');
			};
		}}
	/>
</div>
{#if dragging}
	<p
		transition:scale={{ easing: expoOut }}
		class="endTime"
		style="top: {$pos.y}px; left: {$pos.x}px;"
	>
		{data.end.match(/\d{2}:\d{2}/)}
	</p>
{/if}

<style lang="scss">
	.menu {
		position: fixed;
		background-color: white;
		border-radius: 1em;
		overflow: hidden;
		box-shadow: 0 0 0.25em rgba(var(--primary), 0.15);
		transform-origin: top left;

		z-index: 9999;

		li {
			cursor: pointer;
			display: flex;
			justify-content: space-between;
			align-items: center;
			gap: 2em;
			padding: 1em;
			text-transform: uppercase;
			font-weight: 700;

			transition-property: background-color;

			:global(svg) {
				width: 1.5em;
				height: 1.5em;
			}

			&:hover {
				background-color: rgba(var(--primary), 0.15);
			}
		}
	}

	.endTime {
		position: fixed;

		background-color: rgb(var(--primary));
		color: white;
		font-weight: 800;
		padding: 0.5em 1em;
		border-radius: 1em;

		transform-origin: bottom;
		transform: translate(-50%, -200%);

		z-index: 666;
	}

	.content {
		position: relative;
		height: 100%;
		overflow-x: hidden;
		overflow-y: auto;
		cursor: move;
	}

	.time {
		background-color: white;
		padding: 0.5em 1em;
		border-radius: 1em;
		font-weight: 900;
		width: max-content;
		margin: 1em;
		user-select: none;
	}

	.description {
		font-weight: 700;
		border-radius: 0.5em;
		margin: 1em;
		padding: 0.5em;
		z-index: 100;
		cursor: initial;
	}

	.handle {
		cursor: row-resize;
		position: absolute;
		left: 0;
		right: 0;
		height: 1em;
		z-index: 10;

		&.top {
			top: 0;
		}

		&.bottom {
			bottom: 0;
		}
	}

	.container {
		position: absolute;
		background-color: rgba(var(--primary), 0.35);
		border-left: 0.75em solid rgb(var(--primary));
		border-radius: 1em;
		left: 0;
		right: 0;
	}
</style>
