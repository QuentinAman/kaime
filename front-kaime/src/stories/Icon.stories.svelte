<script>
	import { Template, Meta, Story } from '@storybook/addon-svelte-csf';
	import Icon from '../lib/components/Icon.svelte';
</script>

<Meta
	title="Components/Icon"
	component={Icon}
	argTypes={{
		name: { control: 'text' }
	}}
/>

<Template let:args>
	<Icon {...args} />
</Template>

<Story name="Burger" args={{ name: 'Burger' }} />

<Story name="Logout" args={{ name: 'Logout' }} />

<Story name="Cross" args={{ name: 'Cross' }} />

<Story name="Arrow" args={{ name: 'Arrow' }} />

<Story name="Time" args={{ name: 'Time' }} />

<Story name="User" args={{ name: 'User' }} />

<Story name="Graphic" args={{ name: 'Graphic' }} />
