<script>
	import { modals } from '$lib/stores';
	import { fade, scale } from 'svelte/transition';

	export let title = '';
</script>

<div class="backdrop" transition:fade={{ duration: 400 }} on:click|self={modals.close}>
	<div class="modal" transition:scale={{ duration: 300 }}>
		{#if title}
			<h1>{title}</h1>
		{/if}
		<slot />
	</div>
</div>

<style lang="scss">
	.backdrop {
		position: fixed;
		inset: 0;

		background-color: rgba(black, 0.5);

		z-index: 99999;

		display: flex;
		justify-content: center;
		align-items: center;
	}

	h1 {
		text-align: center;
		border-bottom: 1px solid rgba(var(--primary), 0.15);
		padding-bottom: 0.5em;
		margin-bottom: 1.5em;
	}

	.modal {
		background-color: white;
		border-radius: 2em;
		padding: 3em;
	}
</style>
