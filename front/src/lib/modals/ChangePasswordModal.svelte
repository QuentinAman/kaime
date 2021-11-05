<script>
	import Button from '$lib/components/Button.svelte';
	import Form from '$lib/components/Form.svelte';
	import Modal from '$lib/components/Modal.svelte';
	import Password from '$lib/components/Password.svelte';
</script>

<Modal title="Modifier votre mot de passe">
	<Form>
		<Password placeholder="Nouveau mot de passe" autofocus />
		<Password placeholder="Confirmer le nouveau mot de passe" />
		<Button type="submit">Modifier</Button>
	</Form>
</Modal>
