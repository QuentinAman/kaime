<script>
	import { session } from '$app/stores';

	import Button from '$lib/components/Button.svelte';
	import Capitalize from '$lib/components/Capitalize.svelte';
	import ChangePasswordModal from '$lib/modals/ChangePasswordModal.svelte';
	import { modals } from '$lib/stores';
	import { snacks } from '$lib/stores/snacks';
	import { API } from '$lib/utils';

	const update = (key) => async () => {
		const payload = { [key]: user[key] };
		await API.patch('/self', { user: payload });
		snacks.success('Votre compte à été mis à jour');
	};

	let user = $session.user;
</script>

<main>
	<h1>{user.email}</h1>
	<Capitalize bind:value={user.firstname} placeholder="Prénom" on:update={update('firstname')} />
	<Capitalize bind:value={user.lastname} placeholder="Nom" on:update={update('lastname')} />
	<br />
	<Button --width="max-content" on:click={() => modals.open(ChangePasswordModal)}>
		Changer de mot de passe
	</Button>
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

	h1 {
		margin-bottom: 2em;
	}
</style>
