<script>
	export let submit = async () => null;

	let submitting = false;

	const handle = async () => {
		submitting = true;
		try {
			await submit();
		} finally {
			submitting = false;
		}
	};
</script>

<form on:submit|preventDefault={handle}>
	<slot {submitting} />
</form>

<style>
	form {
		display: grid;
		gap: var(--gap, 1.5em);
	}
</style>
