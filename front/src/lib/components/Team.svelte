<script>
	import { goto } from '$app/navigation';

	import { createDelayer } from '$lib/functions';
	import { onDestroy } from 'svelte';
	import Button from './Button.svelte';

	import Icon from './Icon.svelte';

	export let team;
	export let disabled = false;
	/**
	 * @type {() => void}
	 */
	export let remove = undefined;

	/**
	 * @type {() => void}
	 */
	export let update = undefined;

	const { clear, delay } = createDelayer();

	onDestroy(clear);
</script>

<div class="container" class:disabled>
	{#if remove}
		<Icon click={remove} name="Cross" />
	{/if}
	{#if update}
		<h1
			style="cursor: text;"
			contenteditable="true"
			bind:textContent={team.name}
			on:input={() => delay(update)}
		/>
	{:else}
		<h1>{team.name}</h1>
	{/if}
	<Button reverted on:click={() => goto(`/teams/${team.id}`)}>
		<Icon --width="2em" name="Eye" />
	</Button>
</div>

<style lang="scss">
	.container {
		position: relative;

		border-radius: 2em;
		background-color: rgb(var(--primary));
		padding: 2em;
		padding-right: 4em;
		color: white;

		transition-property: transform, opacity;

		& > :global(svg) {
			position: absolute;

			background-color: white;
			color: rgb(var(--primary));
			padding: 1em;
			border-bottom-left-radius: inherit;

			top: 0;
			right: 0;

			--width: 4em;
		}

		h1::selection {
			background-color: white;
			color: rgb(var(--primary));
		}

		:global(button) {
			margin-top: 1em;
			display: flex;
			align-items: center;
			--width: max-content;
		}

		&.disabled {
			opacity: 0.5;
			pointer-events: none;
			transform: scale(0.95);
		}
	}
</style>
