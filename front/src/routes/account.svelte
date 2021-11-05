<script>
	import Button from '$lib/components/Button.svelte';
	import Capitalize from '$lib/components/Capitalize.svelte';
	import Email from '$lib/components/Email.svelte';

	let firstname = '';
	let lastname = '';
	let email = '';
</script>

<main>
	<form>
		<Capitalize bind:value={firstname} placeholder="Prénom" />
		<Capitalize bind:value={lastname} placeholder="Nom" />
		<Email bind:value={email} />
		<Button>Changer de mot de passe</Button>
	</form>
	<Button --width="max-content">Supprimer mon compte</Button>
</main>

<style>
	form,
	main {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}

	main {
		padding: 5em 0;
	}

	form {
		gap: 1.5em;
		margin-bottom: 1em;
	}
</style>
