<script>
	import Icon from './Icon.svelte';
	/**
	 * @type {Icon["$$prop_def"]["name"]}
	 */
	export let icon = null;
	export let href = '';
	export let current = false;
</script>

<a {href} class:current class:icon on:click>
	{#if icon}
		<div>
			<Icon name={icon} />
		</div>
	{/if}
	<slot />
</a>

<style lang="scss">
	a {
		display: flex;
		justify-content: center;
		align-items: center;
		background-color: rgb(var(--primary));
		color: white;
		padding: 1em;
		gap: 2em;
		text-decoration: none;
		text-align: end;
		font-size: 1.5em;
		font-weight: 700;

		transition-property: background-color;

		&.current {
			color: rgb(var(--primary));
			background-color: white;
		}

		&.icon {
			justify-content: space-between;
		}
	}

	div {
		border: 0.15em solid currentColor;
		border-radius: 0.2em;
		display: flex;
		align-items: center;
		justify-content: center;
		width: 1.25em;
		height: 1.25em;
		padding: 0.15em;
		flex-shrink: 0;

		& :global(svg) {
			width: 100%;
			height: 100%;
		}
	}

	@media (min-width: 468px) {
		a {
			gap: 4em;
		}
	}
</style>
