<script>
	import { goto } from '$app/navigation';

	import { session } from '$app/stores';

	import Button from '$lib/components/Button.svelte';
	import Modal from '$lib/components/Modal.svelte';
	import { cookie, modals } from '$lib/stores';
	import { API } from '$lib/utils';

	let disabled = false;

	const deleteAccount = async () => {
		try {
			disabled = true;
			await API.delete('/self');
			cookie.deleteItem('token');
			$session.user = null;
			goto('/login');
			modals.close();
		} finally {
			disabled = true;
		}
	};
</script>

<Modal title="Êtes-vous sûr ?">
	<Button {disabled} on:click={deleteAccount}>Supprimer</Button>
</Modal>
