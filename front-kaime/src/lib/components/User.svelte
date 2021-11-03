<script>
	import Icon from './Icon.svelte';
	import Button from './Button.svelte';

	export let user;
</script>

<div class="card">
	<div class="delete">
		<Icon name="Cross" />
	</div>
	<div class="header">
		<Icon name="User" />
		<div class="userinfo">
			<h1 class="name">{user.name}</h1>
			<div class="email">{user.email}</div>
		</div>
	</div>
	<div class="footer">
		<div class="left">
			<Button reverted><Icon name="Graphic" />Graphiques</Button>
			<Button reverted><Icon name="Time" />Ses temps</Button>
		</div>
		<div class="right" />
	</div>
</div>

<style>
	.delete {
		background-color: white;
		color: rgb(var(--primary));
		position: absolute;

		top: 0;
		right: 0;

		width: var(--delete-size);
		height: var(--delete-size);
		padding: 0.75em;
		border-radius: 0 1.5em;
	}

	.delete > :global(svg) {
		cursor: pointer;
		transition-property: transform;
		z-index: 35;
	}

	.delete > :global(svg:hover) {
		transform: scale(1.1);
	}

	.delete > :global(svg:active) {
		transform: scale(0.9);
	}

	.delete::after,
	.delete::before {
		position: absolute;
		background-color: white;
		content: '';
		padding: 0.75em;
	}

	.delete::after {
		right: 0;
		top: var(--delete-size);
	}

	.delete::before {
		right: var(--delete-size);
		top: 0;
	}

	.card {
		display: flex;
		width: max-content;
		position: relative;
		flex-direction: column;
		color: white;
		background-color: rgb(var(--primary));
		border-radius: 1.5em;
		border-top-right-radius: 1.75em;
		padding: 1em;
		width: 100%;

		--delete-size: 3em;
	}

	.card::before,
	.card::after {
		position: absolute;
		z-index: 10;
		content: '';
		background-color: rgb(var(--primary));
		border-radius: inherit;
		padding: 1.5em;
	}

	.card::after {
		right: 0;
		bottom: 0;
		top: var(--delete-size);
	}

	.card::before {
		left: 0;
		right: var(--delete-size);
		top: 0;
	}

	.header,
	.footer {
		z-index: 15;
	}

	.header {
		display: flex;
		padding: 1em;
		align-items: center;
		gap: 1em;
		pointer-events: none;
	}

	.header .userinfo .email {
		font-weight: bold;
	}

	.footer {
		display: flex;
		padding: 1em;
	}

	.footer .left {
		display: flex;
		justify-content: start;
		flex-direction: column;
		gap: 1em;
	}

	.footer :global(svg),
	.header :global(svg) {
		border: 5px solid white;
		border-radius: 0.4em;
		padding: 10px 15px;
		width: 5em;
	}

	.footer :global(svg) {
		width: 2em;
		padding: 3px;
		border: 4px solid rgb(var(--primary));
		border-radius: 0.3em;
	}

	.footer :global(button) {
		display: flex;
		align-items: center;
		padding: 1em 1.5em;
		gap: 1em;
		font-weight: bold;
	}
</style>
