<script>
	import { Template, Meta, Story } from '@storybook/addon-svelte-csf';
	import Card from '../lib/components/Card.svelte';
</script>

<Meta title="Components/Card" component={Card} />

<Template let:args>
	<Card {...args} />
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
