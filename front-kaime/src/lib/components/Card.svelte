<script>
	import Icon from './Icon.svelte';
	import Button from './Button.svelte';

	export let user;
</script>

<div class="card">
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
	.card {
		display: flex;
		width: max-content;
		flex-direction: column;
		color: white;
		background-color: rgb(var(--primary));
		border-radius: 1.5em;
		padding: 1em;
	}

	.header {
		display: flex;
		padding: 1em;
		align-items: center;
		gap: 1em;
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

	.card :global(svg) {
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
