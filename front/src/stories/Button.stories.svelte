<script>
	import { Template, Meta, Story } from '@storybook/addon-svelte-csf';
	import { action } from '@storybook/addon-actions';
	import Button from '../lib/components/Button.svelte';
</script>

<Meta title="Components/Button" component={Button} />

<Template let:args>
	<Button on:click={action('click')} {...args}>{args.slot}</Button>
</Template>

<Story name="Default" args={{ slot: 'Text' }} />

<Story name="Reverted" args={{ reverted: true, slot: 'Text' }} />
