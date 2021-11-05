<script>
	import Button from '$lib/components/Button.svelte';
	import Email from '$lib/components/Email.svelte';
	import Form from '$lib/components/Form.svelte';
	import Logo from '$lib/components/Logo.svelte';
	import Password from '$lib/components/Password.svelte';

	let email = '';
	let password = '';
</script>

<main>
	<h1>Kaïme</h1>
	<Logo />
	<Form>
		<Email bind:value={email} autofocus />
		<Password bind:value={password} autocomplete="new-password" />
		<Button type="submit">Se connecter</Button>
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
