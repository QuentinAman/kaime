<script>
	import Input from './Input.svelte';

	export let value = '';
	export let placeholder = 'Email';

	$: value = value.trim().toLowerCase().replace(/\s+/g, '');
</script>

<Input bind:value type="email" {placeholder} autocomplete="email" {...$$restProps} on:update />
