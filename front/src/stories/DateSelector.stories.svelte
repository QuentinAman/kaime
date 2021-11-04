<script>
	import { Template, Meta, Story } from '@storybook/addon-svelte-csf';
	import DateSelector from '../lib/components/DateSelector.svelte';
</script>

<Meta
	title="Components/DateSelector"
	component={DateSelector}
	argTypes={{
		date: {
			control: 'date'
		}
	}}
/>

<Template let:args>
	<DateSelector {...args} />
</Template>

<Story
	name="Default"
	args={{
		date: Date.now()
	}}
/>
