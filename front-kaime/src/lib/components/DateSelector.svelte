<script>
	import Icon from './Icon.svelte';

	export let date = 0;

	const formatter = new Intl.DateTimeFormat('fr-FR', {
		day: 'numeric',
		year: 'numeric',
		month: 'long'
	});

	const add = (n) => {
		const d = new Date(date);
		date = d.setDate(d.getDate() + n);
	};

	$: text = formatter.format(new Date(date));
</script>

<div>
	<button on:click={() => add(-1)}>
		<Icon name="Arrow" />
	</button>
	<span>{text}</span>
	<button on:click={() => add(1)}>
		<Icon name="Arrow" />
	</button>
</div>

<style>
	div {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}

	span {
		font-weight: 900;
		font-size: 2em;
	}

	button {
		cursor: pointer;
		border: none;
		background-color: rgb(var(--primary));
		color: white;

		display: flex;
		align-items: center;
		justify-content: center;

		width: 5em;
		height: 5em;

		border-radius: 50%;
		transition-property: transform;
	}

	button:hover {
		transform: scale(1.05);
	}

	button:active {
		transform: scale(0.95);
	}

	button:first-of-type > :global(svg) {
		transform: rotate(180deg);
	}

	button > :global(svg) {
		width: 1.5em;
	}
</style>
