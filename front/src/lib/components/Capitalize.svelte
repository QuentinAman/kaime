<script>
	import Input from './Input.svelte';

	export let value = '';
	export let placeholder = '';

	$: value = value.replace(/\b[a-z]/, (m) => m.toUpperCase());
</script>

<Input bind:value {placeholder} on:update {...$$restProps} />
