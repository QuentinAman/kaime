<script>
	export let submit = async () => null;

	let submitting = false;
	let error = null;

	const handle = async () => {
		error = null;
		submitting = true;
		try {
			await submit();
		} catch (err) {
			error = err;
		} finally {
			submitting = false;
		}
	};
</script>

<form on:submit|preventDefault={handle}>
	<slot {submitting} {error} />
</form>

<style>
	form {
		display: grid;
		gap: var(--gap, 1.5em);
	}
</style>
