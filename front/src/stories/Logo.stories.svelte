<script>
	import { action } from '@storybook/addon-actions';

	import { Template, Meta, Story } from '@storybook/addon-svelte-csf';
	import Logo from '../lib/components/Logo.svelte';
</script>

<Meta title="Components/Logo" component={Logo} />

<Template let:args>
	<main><Logo {...args} on:finish={action('finish')} /></main>
</Template>

<Story name="Default" />

<style>
	main {
		display: flex;
		justify-content: center;
		align-items: center;
		height: 75vh;
	}
</style>
