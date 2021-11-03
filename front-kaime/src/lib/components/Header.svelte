<script>
	import Icon from './Icon.svelte';
	import Logo from './Logo.svelte';
	import Nav from './Nav.svelte';

	let open = false;
</script>

<header>
	<Icon name="Logout" />
	<Logo />
	<Icon name="Burger" on:click={() => (open = true)} />
</header>
<Nav bind:open />

<style>
	header {
		display: flex;
		justify-content: space-between;
		gap: 2em;
	}

	header > :global(svg) {
		cursor: pointer;
	}

	@media (min-width: 768px) {
		header {
			justify-content: flex-start;
		}
	}
</style>
