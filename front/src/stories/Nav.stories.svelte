<script>
	import { Template, Meta, Story } from '@storybook/addon-svelte-csf';
	import Nav from '../lib/components/Nav.svelte';
</script>

<Meta title="Components/Nav" component={Nav} />

<Template let:args>
	<Nav {...args} />
</Template>

<Story
	name="Default"
	args={{
		open: true,
		location: '/working-times',
		links: {
			'/working-times': {
				text: 'Vos Temps',
				icon: 'Time'
			},

			'/graphics': {
				text: 'Graphiques',
				icon: 'Graphic'
			},

			'/account': {
				text: 'Compte',
				icon: 'User'
			}
		}
	}}
/>
