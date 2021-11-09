<script>
	import Time from './Time.svelte';
	import WorkingTime from './WorkingTime.svelte';

	/**
	 * @type {WorkingTime["$$prop_def"]["data"][]}
	 */
	export let workingTimes = [];

	const hours = Array(25).fill();
</script>

<div>
	<ul>
		{#each hours as _, hour}
			<li><Time hours={hour} /></li>
		{/each}
		{#each workingTimes as data}
			<WorkingTime left="6ch" bind:data />
		{/each}
	</ul>
</div>

<style lang="scss">
	div {
		position: relative;
		overflow: hidden;
		padding: 1.5em 0;

		&::before,
		&::after {
			content: '';
			position: absolute;
			left: 0;
			right: 0;
			height: 1em;
			z-index: 99;
			background: linear-gradient(var(--direction, to top), #fff0, white);
		}

		&::before {
			top: 0;
		}

		&::after {
			bottom: 0;
			--direction: to bottom;
		}
	}

	ul {
		display: flex;
		flex-direction: column;
		position: relative;

		gap: 5em;
	}
</style>
