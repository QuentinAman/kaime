<script>
	import { modals } from '$lib/stores';
	import { fade, scale } from 'svelte/transition';
	import Icon from './Icon.svelte';

	export let title = '';
</script>

<div class="backdrop" transition:fade={{ duration: 400 }} on:click|self={modals.close}>
	<div class="modal" transition:scale={{ duration: 300 }}>
		<Icon name="Cross" click={modals.close} />
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
		position: relative;
		background-color: white;
		padding: 3em;

		width: 100%;
		height: 100%;

		& > :global(:first-child) {
			position: absolute;
			top: 0;
			right: 0;

			background-color: rgb(var(--primary));
			color: white;
			padding: 0.5em;
			width: 3em;
			border-radius: 0 0 0 1em;
		}
	}

	@media (min-width: 768px) {
		.modal {
			width: initial;
			height: initial;
			border-radius: 2em;

			& > :global(:first-child) {
				border-radius: 50%;
				top: -1em;
				right: -1em;
			}
		}
	}
</style>
