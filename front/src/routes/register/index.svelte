<script>
	import Button from '$lib/components/Button.svelte';
	import Capitalize from '$lib/components/Capitalize.svelte';
	import Email from '$lib/components/Email.svelte';
	import Form from '$lib/components/Form.svelte';
	import Input from '$lib/components/Input.svelte';
	import Logo from '$lib/components/Logo.svelte';
	import Password from '$lib/components/Password.svelte';

	let email = '';
	let password = '';
	let firstname = '';
	let lastname = '';
</script>

<main>
	<h1>Kaïme</h1>
	<Logo />
	<Form>
		<Email bind:value={email} autofocus />
		<Capitalize bind:value={firstname} placeholder="Prénom" />
		<Capitalize bind:value={lastname} placeholder="Nom" />
		<Password bind:value={password} />
		<Button>Créer mon compte</Button>
		<p>Vous avez déjà un compte ?</p>
		<a href="/login">Se connecter</a>
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
		justify-content: center;
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
