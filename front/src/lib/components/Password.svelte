<script>
	import Input from './Input.svelte';

	export let value = '';
	export let placeholder = 'Mot de passe';
	export let autocomplete = 'new-password';
</script>

<Input bind:value type="password" {placeholder} {autocomplete} />
