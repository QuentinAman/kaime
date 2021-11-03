<script>
	import { Template, Meta, Story } from '@storybook/addon-svelte-csf';
	import Input from '../lib/components/Input.svelte';
</script>

<Meta
	title="Components/Input"
	component={Input}
	argTypes={{
		icon: { control: 'text' }
	}}
/>

<Template let:args>
	<Input {...args} />
</Template>

<Story
	name="Default"
	args={{
		value: 'Value'
	}}
/>

<Story
	name="Placeholder"
	args={{
		placeholder: 'Placeholder',
		value: 'Value'
	}}
/>

<Story
	name="With Icon"
	args={{
		value: 'Value',
		icon: 'Cross'
	}}
/>

<Story
	name="Placeholder With Icon"
	args={{
		placeholder: 'Placeholder',
		value: 'Value',
		icon: 'Cross'
	}}
/>
