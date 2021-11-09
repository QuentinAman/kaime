<script>
	import Icon from './Icon.svelte';

	export let value = 0;

	const formatter = new Intl.DateTimeFormat('fr-FR', {
		day: 'numeric',
		year: 'numeric',
		month: 'short'
	});

	const add = (n) => {
		const d = new Date(value);
		value = d.setDate(d.getDate() + n);
	};

	$: text = formatter.format(new Date(value));
</script>

<div class="container">
	<div class="btn" on:click={() => add(-1)}>
		<Icon name="Arrow" />
	</div>
	<span>{text}</span>
	<div class="btn" on:click={() => add(1)}>
		<Icon name="Arrow" />
	</div>
</div>

<style lang="scss">
	.container {
		display: flex;
		justify-content: space-between;
		align-items: center;
		gap: 4em;
		font-size: 0.75em;
	}

	span {
		font-weight: 900;
		font-size: 2em;
		text-align: center;
	}

	.btn {
		cursor: pointer;
		border: none;
		background-color: rgb(var(--primary));
		color: white;
		flex-shrink: 0;
		font: inherit;

		display: flex;
		align-items: center;
		justify-content: center;

		width: 4em;
		height: 4em;
		padding: 1.5em;

		border-radius: 50%;
		transition-property: transform;

		&:first-child > :global(*) {
			--rotate: 180deg;
		}

		&:hover {
			transform: scale(1.05);
		}

		&:active {
			transform: scale(0.95);
		}
	}

	@media (min-width: 768px) {
		div {
			font-size: 1em;
		}
	}
</style>
