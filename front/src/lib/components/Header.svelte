<script>
	import Icon from './Icon.svelte';
	import Logo from './Logo.svelte';
	import Nav from './Nav.svelte';

	export let path = '';

	let open = false;
</script>

<header>
	<Icon name="Logout" --width="4em" />
	<p>Se déconnecter</p>
	<div class="logo">
		<Logo clickable />
	</div>
	<div class="burger">
		<Icon name="Burger" on:click={() => (open = true)} --width="4em" />
	</div>
</header>
<Nav
	bind:open
	{path}
	links={{
		'/workingTimes': {
			text: 'Mes Temps',
			icon: 'Time'
		},
		'/graphics': {
			text: 'Graphiques',
			icon: 'Graphic'
		},
		'/account': {
			text: 'Mon Compte',
			icon: 'User'
		}
	}}
/>

<style lang="scss">
	p {
		display: none;
	}

	header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		gap: 1em;
		padding: 1em;
		margin-top: 1em;
		font-size: 0.75em;
	}

	@media (min-width: 768px) {
		header {
			justify-content: flex-start;

			.burger {
				margin-left: auto;
			}
		}

		p {
			display: initial;
			margin-right: 5em;
		}
	}
</style>
