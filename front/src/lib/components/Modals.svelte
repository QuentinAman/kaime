<script>
	import { modals } from '$lib/stores';
</script>

{#if $modals.modal}
	<svelte:component this={$modals.modal} {...$modals.props} />
{/if}
