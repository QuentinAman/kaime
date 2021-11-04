<script>
	import { Template, Meta, Story } from '@storybook/addon-svelte-csf';
	import { toString } from '../lib/components/WorkingTime.svelte';
	import WorkingTimes from '../lib/components/WorkingTimes.svelte';

	const workingTimes = [];
	const now = new Date();

	const push = () => {
		const start = toString(now);
		now.setHours(now.getHours() + 3);
		const end = toString(now);
		now.setHours(now.getHours() + 1);

		workingTimes.push({
			start,
			end,
			description: 'Travail...'
		});
	};

	push();
	push();
</script>

<Meta title="Components/WorkingTimes" component={WorkingTimes} />

<Template let:args>
	<WorkingTimes {...args} />
</Template>

<Story name="Default" args={{ workingTimes }} />
