<script>
	import { session } from '$app/stores';

	import Button from '$lib/components/Button.svelte';
	import Capitalize from '$lib/components/Capitalize.svelte';
	import Email from '$lib/components/Email.svelte';

	const update = async () => {
		console.log('update user', user);
	};

	let user = $session.user;
</script>

<main>
	<Capitalize bind:value={user.firstname} placeholder="Prénom" on:update={update} />
	<Capitalize bind:value={user.lastname} placeholder="Nom" on:update={update} />
	<Email bind:value={user.email} on:update={update} />
	<Button --width="max-content" type="submit">Changer de mot de passe</Button>
	<Button --width="max-content">Supprimer mon compte</Button>
</main>

<style>
	main {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		gap: 1.5em;
	}

	main {
		padding: 5em 0;
	}
</style>
