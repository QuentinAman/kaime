<script>
	import { Template, Meta, Story } from '@storybook/addon-svelte-csf';
	import Time from '../lib/components/Time.svelte';

	const now = new Date();
</script>

<Meta title="Components/Time" component={Time} />

<Template let:args>
	<Time {...args} />
</Template>

<Story
	name="Default"
	args={{
		hours: now.getHours(),
		minutes: now.getMinutes()
	}}
/>
