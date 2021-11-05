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

<style>
	div {
		overflow: hidden;
		padding: 0.5em 0;
	}

	ul {
		display: flex;
		flex-direction: column;
		position: relative;

		gap: 5em;
	}
</style>
