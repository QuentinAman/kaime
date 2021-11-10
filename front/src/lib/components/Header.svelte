<script>
	import { goto } from '$app/navigation';
	import { session } from '$app/stores';
	import { cookie } from '$lib/stores/cookie';
	import { API } from '$lib/utils';

	import Icon from './Icon.svelte';
	import Logo from './Logo.svelte';
	import Nav from './Nav.svelte';

	export let path = '';

	let open = false;
	let submitting = false;

	const logout = () => {
		cookie.deleteItem('token');
		$session.user = null;
		goto('/login');
	};

	const submit =
		(cb) =>
		async (...args) => {
			submitting = true;
			try {
				await cb(...args);
			} finally {
				submitting = false;
			}
		};

	const start = submit(async () => {
		$session.user.clock = await API.patch('/self/clock', { time: $session.user.clock.time });
	});

	const finish = submit(async (e) => {
		$session.user.clock = await API.patch('/self/clock', { time: e.detail });
		$session.user.workingTimes = await API.get('/self/workingtimes');
	});
</script>

<header>
	<Icon name="Logout" --width="4em" click={logout} />
	<p>Se déconnecter</p>
	<div class="logo" class:submitting>
		<Logo
			clickable
			bind:timerStartedAt={$session.user.clock.time}
			on:start={start}
			on:finish={finish}
		/>
	</div>
	<div class="burger">
		<Icon name="Burger" click={() => (open = true)} />
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

	.logo {
		transition-property: opacity, transform;

		&.submitting {
			pointer-events: none;
			opacity: 0.5;
			transform: scale(0.85);
		}
	}

	.burger {
		--width: 4em;
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
