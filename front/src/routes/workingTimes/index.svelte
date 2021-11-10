<script>
	import { session } from '$app/stores';

	import DateSelector from '$lib/components/DateSelector.svelte';
	import { toString } from '$lib/components/WorkingTime.svelte';
	import WorkingTimes from '$lib/components/WorkingTimes.svelte';

	let date = Date.now();

	$: workingTimes = $session.user.workingTimes.filter((w) => {
		const top = new Date(date);
		top.setHours(0, 0, 0, 0);
		const bottom = new Date(top);
		bottom.setDate(top.getDate() + 1);

		top.setHours(top.getHours() - 1);
		bottom.setHours(bottom.getHours() + 1);

		const start = Date.parse(w.start);
		const end = Date.parse(w.end);

		return end > top.getTime() && start < bottom.getTime();
	});
</script>

<main>
	<DateSelector bind:value={date} />
	<div>
		<WorkingTimes {date} {workingTimes} />
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
