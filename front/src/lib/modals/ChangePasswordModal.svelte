<script>
	import Button from '$lib/components/Button.svelte';
	import Form from '$lib/components/Form.svelte';
	import Modal from '$lib/components/Modal.svelte';
	import Password from '$lib/components/Password.svelte';
	import { modals } from '$lib/stores';
	import { snacks } from '$lib/stores/snacks';

	const updatePassword = async () => {
		snacks.success('Votre mot de passe à été mis à jour');
		modals.close();
	};
</script>

<Modal title="Modifier votre mot de passe">
	<Form submit={updatePassword}>
		<Password placeholder="Nouveau mot de passe" autofocus />
		<Password placeholder="Confirmer le nouveau mot de passe" />
		<Button type="submit">Modifier</Button>
	</Form>
</Modal>
