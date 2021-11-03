<script>
	import Icon from './Icon.svelte';

	export let placeholder = '';
	export let value = '';

	/**
	 * @type {Icon["$$prop_def"]["name"]}
	 */
	export let icon = null;
</script>

<label class:empty={!value}>
	{#if placeholder}
		<p>{placeholder}</p>
	{/if}
	<input type="text" bind:value />
	{#if icon}
		<Icon name={icon} on:click />
	{/if}
</label>

<style>
	label {
		position: relative;
		display: flex;
		border: 1px solid rgb(var(--primary));
		border-radius: 1em;
	}

	label > :global(svg) {
		width: 1em;
		margin: 1em;
	}

	label:not(.empty) p,
	label:focus-within p {
		top: 0;
	}

	p {
		position: absolute;
		background-color: white;
		padding: 0 0.5em;
		top: 50%;
		border-radius: 1em;
		left: 0.5em;
		transform: translateY(-50%);
		transition-property: top;
	}

	input {
		border: none;
		width: 100%;
		padding: 1em;
		background: none;
		border-radius: inherit;
		outline: none;
		font: inherit;
		color: inherit;
	}
</style>
