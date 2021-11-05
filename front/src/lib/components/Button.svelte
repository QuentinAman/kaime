<script>
	export let reverted = false;
	export let disabled = false;
</script>

<button type="button" {disabled} class:reverted on:click {...$$restProps}><slot /></button>

<style lang="scss">
	button {
		cursor: pointer;
		width: var(--width, 100%);
		text-transform: uppercase;
		background-color: rgb(var(--primary));
		padding: 1em 2em;
		outline: none;
		font: inherit;
		color: white;
		border: none;
		border-radius: 2em;
		transition-property: transform;

		&.reverted {
			background-color: white;
			color: rgb(var(--primary));
		}

		&:hover {
			transform: scale(1.05);
		}

		&:active {
			transform: scale(0.95);
		}

		&:disabled {
			pointer-events: none;
			opacity: 0.5;
		}
	}
</style>
