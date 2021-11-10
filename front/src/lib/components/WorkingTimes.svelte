<script>
	import { API } from '$lib/utils';
	import { session } from '$app/stores';

	import Time from './Time.svelte';
	import WorkingTime from './WorkingTime.svelte';
	import { snacks } from '$lib/stores';

	/**
	 * @type {WorkingTime["$$prop_def"]["data"][]}
	 */
	export let workingTimes = [];
	export let date;

	const hours = Array(25).fill();

	const getWorkingTimes = async () => {
		$session.user.workingTimes = await API.get('/self/workingtimes');
	};
</script>

<div>
	<ul>
		{#each hours as _, hour}
			<li><Time hours={hour} /></li>
		{/each}
		{#key date}
			{#each workingTimes as data (data.id)}
				<WorkingTime
					left="6ch"
					date={new Date(date)}
					bind:data
					on:update={async () => {
						await API.patch(`/self/workingtimes/${data.id}`, { workingtime: data }, false);
					}}
					on:delete={async () => {
						await API.delete(`/self/workingtimes/${data.id}`);
						await getWorkingTimes();
					}}
				/>
			{/each}
		{/key}
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
