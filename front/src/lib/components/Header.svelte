<script>
	import Icon from './Icon.svelte';
	import Logo from './Logo.svelte';
	import Nav from './Nav.svelte';

	let open = false;
</script>

<header>
	<Icon name="Logout" />
	<p>Se déconnecter</p>
	<div class="logo">
		<Logo />
	</div>
	<p>Lancer le timer</p>
	<Icon name="Burger" on:click={() => (open = true)} />
</header>
<Nav bind:open />

<style>
	p {
		display: none;
	}

	.logo {
		font-size: 0.75em;
	}

	header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		gap: 1em;
		padding: 1em;
		margin-top: 1em;
	}

	header > :global(svg) {
		cursor: pointer;
		width: 4em;
	}

	@media (min-width: 768px) {
		header {
			justify-content: flex-start;
		}

		p {
			display: initial;
			margin-right: 5em;
		}

		header > :global(svg:last-of-type) {
			margin-left: auto;
		}
	}
</style>
