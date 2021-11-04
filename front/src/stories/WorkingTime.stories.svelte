<script>
	import { Template, Meta, Story } from '@storybook/addon-svelte-csf';
	import WorkingTime, { toString } from '../lib/components/WorkingTime.svelte';

	const now = new Date();

	const start = toString(now);
	now.setHours(now.getHours() + 6);
	const end = toString(now);

	let data = {
		start,
		end,
		description: "J'ai beaucoup travaillé"
	};
</script>

<Meta title="Components/WorkingTime" component={WorkingTime} />

<Template let:args>
	<div>
		<WorkingTime {...args} />
	</div>
</Template>

<Story name="Default" args={{ data }} />

<style>
	div {
		height: 100vh;
		position: relative;
		border: 2px dotted currentColor;
	}
</style>
