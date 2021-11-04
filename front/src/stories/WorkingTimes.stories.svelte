<script>
	import { Template, Meta, Story } from '@storybook/addon-svelte-csf';
	import WorkingTimes from '../lib/components/WorkingTimes.svelte';

	const workingTimes = [];
	const now = new Date();

	const push = () => {
		const start = now.toLocaleString();
		now.setHours(now.getHours() + 3);
		const end = now.toLocaleString();

		workingTimes.push({
			start,
			end
		});
	};

	push();
</script>

<Meta title="Components/WorkingTimes" component={WorkingTimes} />

<Template let:args>
	<WorkingTimes {...args} />
</Template>

<Story name="Default" args={{ workingTimes }} />
