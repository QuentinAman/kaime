<script>
	import DateSelector from '$lib/components/DateSelector.svelte';
	import { toString } from '$lib/components/WorkingTime.svelte';
	import WorkingTimes from '$lib/components/WorkingTimes.svelte';

	let date = Date.now();

	const now = new Date();
	const start = toString(now);
	now.setHours(now.getHours() + 2);
	const end = toString(now);
</script>

<main>
	<DateSelector bind:value={date} />
	<div>
		<WorkingTimes
			workingTimes={[
				{
					start,
					end,
					description: 'Description...'
				}
			]}
		/>
	</div>
</main>

<style>
	main {
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 5em;
		padding: 0 5vw;
		padding-bottom: 5vw;
	}

	div {
		width: 100%;
	}
</style>
