<script>
	import Icon from './Icon.svelte';
	import { slide } from 'svelte/transition';
	import { createEventDispatcher } from 'svelte';
	import { createDelayer } from '$lib/functions';

	const dispatch = createEventDispatcher();

	export let placeholder = '';
	export let value = '';
	/**
	 * @type {string[]}
	 */
	export let options = null;

	/**
	 * @type {Icon["$$prop_def"]["name"]}
	 */
	export let icon = null;
	export let onIconClick = null;
	let focus = false;

	const { delay } = createDelayer(1000);

	const update = () => {
		delay(() => dispatch('update'));
	};
</script>

<label class:empty={!value}>
	{#if placeholder}
		<p>{placeholder}</p>
	{/if}
	<input
		type="text"
		bind:value
		on:focus={() => (focus = true)}
		on:blur={() => (focus = false)}
		on:input={update}
		{...$$restProps}
	/>
	{#if icon}
		<Icon
			name={icon}
			--width="1.5em"
			on:mousedown={onIconClick}
			style="cursor: {onIconClick ? 'pointer' : 'initial'}; margin-right: 1em"
		/>
	{/if}
	{#if options && focus}
		<ul transition:slide>
			{#each options as option}
				<li on:mousedown={() => (value = option)}>{option}</li>
			{:else}
				<li style="text-align: center;">...</li>
			{/each}
		</ul>
	{/if}
</label>

<style lang="scss">
	ul {
		overflow-y: auto;
		max-height: 15em;
		position: absolute;
		top: calc(100% + 0.6em);
		list-style: none;
		font-weight: bold;
		left: 1em;
		right: 1em;
		border: 1px solid currentColor;
		border-radius: 1em;
		z-index: 10;

		&::-webkit-scrollbar {
			display: none;
		}
	}

	ul li {
		cursor: pointer;
		padding: 1em;
		transition-property: background-color;

		&:hover {
			background-color: rgba(var(--primary), 0.15);
		}
	}

	label {
		position: relative;
		display: flex;
		border: 1px solid rgb(var(--primary));
		outline: 0px solid rgba(var(--primary), 0.15);
		border-radius: 3em;

		transition: linear 100ms outline-width;

		& > :global(svg) {
			margin: 1em;
		}

		&:not(.empty),
		&:focus-within {
			p {
				top: 0;
			}
		}

		&:focus-within {
			outline-width: 3px;
		}
	}

	p {
		position: absolute;
		background-color: white;
		padding: 0 0.5em;
		top: 50%;
		border-radius: 1em;
		left: 1em;
		transform: translateY(-50%);
		transition-property: top;
		pointer-events: none;
	}

	input {
		border: none;
		width: 100%;
		padding: 1em 1.5em;
		background: none;
		border-radius: inherit;
		outline: none;
		font: inherit;
		color: inherit;
	}
</style>
