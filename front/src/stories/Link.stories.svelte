<script>
	import { Template, Meta, Story } from '@storybook/addon-svelte-csf';
	import Link from '../lib/components/Link.svelte';
</script>

<Meta title="Components/Link" component={Link} />

<Template let:args>
	<Link {...args}>{args.slot}</Link>
</Template>

<Story
	name="Default"
	args={{
		slot: 'Text',
		href: '/path'
	}}
/>

<Story
	name="Current"
	args={{
		slot: 'Text',
		href: '/path',
		current: true
	}}
/>

<Story
	name="Icon"
	args={{
		slot: 'Mon Compte',
		href: '/account',
		current: false,
		icon: 'User'
	}}
/>
