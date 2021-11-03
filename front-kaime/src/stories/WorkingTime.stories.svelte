<script>
	import { Template, Meta, Story } from '@storybook/addon-svelte-csf';
	import WorkingTime from '../lib/components/WorkingTime.svelte';

	const now = new Date();

	const start = now.toLocaleString();
	now.setHours(now.getHours() + 6);
	const end = now.toLocaleString();
</script>

<Meta title="Components/WorkingTime" component={WorkingTime} />

<Template let:args>
	<WorkingTime {...args} />
</Template>

<Story
	name="Default"
	args={{
		data: { start, end }
	}}
/>
