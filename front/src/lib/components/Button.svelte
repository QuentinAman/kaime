<script>
	export let reverted = false;
</script>

<button class:reverted on:click><slot /></button>

<style>
	button {
		cursor: pointer;
		text-transform: uppercase;
		background-color: rgb(var(--primary));
		padding: 1em 2em;
		outline: none;
		font: inherit;
		color: white;
		border: none;
		border-radius: 2em;
		transition-property: transform;
	}

	button.reverted {
		background-color: white;
		color: rgb(var(--primary));
	}

	button:hover {
		transform: scale(1.05);
	}

	button:active {
		transform: scale(0.95);
	}
</style>
