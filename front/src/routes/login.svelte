<script>
	import { goto } from '$app/navigation';
	import { session } from '$app/stores';

	import Button from '$lib/components/Button.svelte';
	import Email from '$lib/components/Email.svelte';
	import Form from '$lib/components/Form.svelte';
	import Logo from '$lib/components/Logo.svelte';
	import Password from '$lib/components/Password.svelte';
	import { getSelf } from '$lib/functions';
	import { cookie } from '$lib/stores/cookie';
	import { API } from '$lib/utils';

	let email = '';
	let password = '';

	const login = async () => {
		const { token } = await API.post('/sign_in', {
			email,
			password
		});

		$cookie.token = token;
		$session.user = await getSelf(token);
		goto('/workingTimes');
	};
</script>

<main>
	<h1>{import.meta.env.VITE_APP}</h1>
	<Logo />
	<Form submit={login} let:submitting>
		<Email bind:value={email} autofocus />
		<Password bind:value={password} autocomplete="new-password" />
		<Button disabled={submitting} type="submit">Se connecter</Button>
		<p>Vous n'avez pas de compte ?</p>
		<a href="/register">Créer un compte</a>
	</Form>
	<footer>Made with ❤ by Epitech</footer>
</main>

<style lang="scss">
	main {
		display: flex;
		flex-direction: column;
		align-items: center;
		min-height: 100vh;
		gap: 3em;
		padding: 1em;
		text-align: center;
	}

	h1 {
		color: rgb(var(--primary));
		font-size: 3em;
		font-weight: 900;
	}

	a {
		margin-top: -1em;
		text-decoration: underline;
		color: rgb(var(--primary));
	}

	footer {
		margin-top: auto;
	}
</style>
