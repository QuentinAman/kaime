<script>
	export let hours = 0;
	export let minutes = 0;

	const now = new Date();

	$: now.setHours(hours, minutes);
</script>

<div class="container">
	<p>{now.toLocaleTimeString().replace(/:[^:]+$/, '')}</p>
	<div class="bar" />
</div>

<style scoped>
	.container {
		position: relative;
		display: flex;
		align-items: center;
	}

	p {
		position: absolute;
		font-weight: 900;
	}

	.bar {
		flex: 1;
		height: 1px;
		background-color: currentColor;
		margin-left: 6ch;
		opacity: 0.25;
	}
</style>
