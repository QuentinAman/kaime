<script>
	import { onDestroy } from 'svelte';

	const getDegrees = () => {
		const now = new Date();
		const toDegree = (n) => n * 360 - 90;

		return {
			hour: toDegree(now.getHours() / 12),
			minute: toDegree(now.getMinutes() / 60),
			seconds: toDegree(now.getSeconds() / 60)
		};
	};

	onDestroy(() => clearInterval(interval));

	let interval = setInterval(() => (degrees = getDegrees()), 1000);
	let degrees = getDegrees();

	$: hour = degrees.hour;
	$: minute = degrees.minute;
	$: seconds = degrees.seconds;
</script>

<div class="container">
	<div class="circle">
		<div class="dot left" />
		<div class="dot right" />
		<div class="bar hour" style="--rotate: {hour}deg" />
		<div class="center" />
		<div class="bar minutes" style="--rotate: {minute}deg" />
		<div class="bar seconds" style="--rotate: {seconds}deg" />
	</div>
</div>

<style>
	.container {
		width: max-content;
	}

	.circle {
		position: relative;

		border: 0.5em solid currentColor;
		width: 6em;
		height: 6em;
		border-radius: 50%;

		display: flex;
		justify-content: center;
		align-items: center;
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
	}

	.bar.hour {
		width: 1em;
	}

	.bar.minutes {
		width: 2em;
	}

	.bar.seconds {
		width: 2.25em;
		height: 0.15em;
		opacity: 0.25;
	}

	.center,
	.dot {
		width: 0.7em;
		height: 0.75em;
		background-color: currentColor;
		border-radius: 50%;
	}

	.dot {
		position: absolute;
		bottom: calc(100% + 0.75em);
	}

	.dot.left {
		transform: translateX(-75%);
	}

	.dot.right {
		transform: translateX(75%);
	}

	.center {
		position: absolute;
		width: 0.5em;
		height: 0.5em;
	}
</style>
