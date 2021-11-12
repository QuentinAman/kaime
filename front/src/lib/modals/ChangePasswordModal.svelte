<script>
	import Button from '$lib/components/Button.svelte';
	import Form from '$lib/components/Form.svelte';
	import Modal from '$lib/components/Modal.svelte';
	import Password from '$lib/components/Password.svelte';
	import { modals } from '$lib/stores';
	import { snacks } from '$lib/stores/snacks';
	import { API } from '$lib/utils';

	let password = '';
	let confirmPassword = '';

	const updatePassword = async () => {
		if (password !== confirmPassword)
			return snacks.danger('Les mots de passes ne correspondent pas.');

		await API.patch('/self/password', { password });
		modals.close();
	};
</script>

<Modal title="Modifier votre mot de passe">
	<Form submit={updatePassword} let:submitting>
		<Password bind:value={password} placeholder="Nouveau mot de passe" autofocus />
		<Password bind:value={confirmPassword} placeholder="Confirmer le nouveau mot de passe" />
		<Button disabled={submitting} type="submit">Modifier</Button>
	</Form>
</Modal>
