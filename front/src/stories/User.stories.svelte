<script>
	import { Template, Meta, Story } from '@storybook/addon-svelte-csf';
	import User from '../lib/components/User.svelte';
</script>

<Meta title="Components/User" component={User} />

<Template let:args>
	<User {...args} />
</Template>

<Story
	name="Default"
	args={{
		user: {
			name: 'John Doe',
			email: 'johndoe@example.com'
		}
	}}
/>
