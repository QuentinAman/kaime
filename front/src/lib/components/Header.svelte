<script>
	import { goto } from '$app/navigation';
	import { session } from '$app/stores';
	import { cookie } from '$lib/stores/cookie';

	import Icon from './Icon.svelte';
	import Logo from './Logo.svelte';
	import Nav from './Nav.svelte';

	export let path = '';

	let open = false;

	const logout = () => {
		cookie.deleteItem('token');
		$session.user = null;
		goto('/login');
	};
</script>

<header>
	<Icon name="Logout" --width="4em" click={logout} />
	<p>Se déconnecter</p>
	<div class="logo">
		<Logo clickable />
	</div>
	<div class="burger">
		<Icon name="Burger" click={() => (open = true)} --width="4em" />
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
		margin-bottom: 5em;
		font-size: 0.75em;
	}

	@media (min-width: 768px) {
		header {
			justify-content: flex-start;
			padding: 1em 2.5em;

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
