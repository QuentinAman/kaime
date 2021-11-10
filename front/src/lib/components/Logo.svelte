<script>
	// @ts-nocheck
	import { scale } from 'svelte/transition';
	import { createEventDispatcher, onDestroy } from 'svelte';

	const dispatch = createEventDispatcher();

	/**
	 * @type {string}
	 */
	export let timerStartedAt = null;
	export let clickable = false;

	let now = new Date();

	const getDegrees = () => {
		now = new Date();
		const toDegree = (n) => n * 360 - 90;

		return {
			hour: toDegree(now.getHours() / 12),
			minute: toDegree(now.getMinutes() / 60),
			seconds: toDegree(now.getSeconds() / 60)
		};
	};

	/**
	 * @param {Date} date
	 */
	const getTimer = (date) => {
		const start = new Date(timerStartedAt);
		const diff = date - start;

		const days = Math.floor(diff / (24 * 60 * 60 * 1000));

		const hours = Math.floor(diff / (60 * 60 * 1000));
		const minutes = Math.floor(diff / (60 * 1000));
		const seconds = Math.floor(diff / 1000);

		let result = '';

		const add = (n, t = ':', force = false) => {
			if (!n && !force) return;
			result += n + t;
		};

		add(days, ` jour${days > 1 ? 's' : ''} `);
		add(hours % 24, 'h ');
		add(minutes % 60, 'm ');
		add(seconds % 60, 's ', true);

		return result;
	};

	onDestroy(() => clearInterval(interval));

	let interval = setInterval(() => (degrees = getDegrees()), 1000);
	let degrees = getDegrees();

	$: hour = degrees.hour;
	$: minute = degrees.minute;
	$: seconds = degrees.seconds;

	$: timer = getTimer(now);
</script>

<div
	class="circle"
	class:clickable
	on:click={() => {
		now = new Date();
		if (timerStartedAt) {
			timerStartedAt = null;
			dispatch('finish', new Date().toISOString());
		} else {
			timerStartedAt = now.toISOString();
			dispatch('start', timerStartedAt);
		}
	}}
>
	<div class="dot left" />
	<div class="dot right" />
	<div class="bar hour" style="--rotate: {hour}deg" />
	<div class="center" />
	<div class="bar minutes" style="--rotate: {minute}deg" />
	<div class="bar seconds" style="--rotate: {seconds}deg" />
	{#if timerStartedAt}
		<div transition:scale|local class="timer">{timer}</div>
	{/if}
	{#if !timerStartedAt && clickable}
		<p transition:scale|local>Lancer le timer</p>
	{/if}
</div>

<style lang="scss">
	.timer {
		position: absolute;
		top: calc(100% + 2ch);
		width: max-content;
		font-size: 1.5em;
		font-weight: 800;
	}

	p {
		position: absolute;
		left: calc(100% + 2ch);
		display: none;
		width: max-content;
		transform-origin: left;
	}

	.circle {
		position: relative;
		cursor: pointer;

		border: 0.5em solid currentColor;
		width: var(--size, 6em);
		height: var(--size, 6em);
		border-radius: 50%;

		display: flex;
		justify-content: center;
		align-items: center;

		transition-property: transform;

		&:not(.clickable) {
			pointer-events: none;
		}

		&:hover {
			transform: scale(1.05);
		}

		&:active {
			transform: scale(0.9) rotate(25deg);
		}
	}

	.bar {
		position: absolute;

		height: 0.35em;
		width: 1.5em;
		background-color: currentColor;
		border-radius: 1em;
		transform-origin: left;
		top: 50%;
		left: 50%;
		transform: translateY(-50%) rotate(var(--rotate, 0deg));

		&.hour {
			width: 1em;
		}

		&.minutes {
			width: 2em;
		}

		&.seconds {
			width: 2.25em;
			height: 0.15em;
			opacity: 0.25;
		}
	}

	.center,
	.dot {
		position: absolute;
		background-color: currentColor;
		border-radius: 50%;
	}

	.dot {
		bottom: calc(100% + 0.75em);
		width: 0.7em;
		height: 0.75em;

		&.left {
			transform: translateX(-75%);
		}

		&.right {
			transform: translateX(75%);
		}
	}

	.center {
		width: 0.5em;
		height: 0.5em;
	}

	@media (min-width: 768px) {
		.timer {
			top: initial;
			left: calc(100% + 2ch);
			transform-origin: left;
		}

		p {
			display: initial;
		}
	}
</style>
