<script>
	import Icon from './Icon.svelte';
	import { slide } from 'svelte/transition';

	export let placeholder = '';
	export let value = '';
	/**
	 * @type {string[]}
	 */
	export let options = null;

	/**
	 * @type {Icon["$$prop_def"]["name"]}
	 */
	export let icon = null;
	export let onIconClick = null;
	let focus = false;
</script>

<label class:empty={!value}>
	{#if placeholder}
		<p>{placeholder}</p>
	{/if}
	<input
		type="text"
		bind:value
		on:focus={() => (focus = true)}
		on:blur={() => (focus = false)}
		{...$$restProps}
	/>
	{#if icon}
		<Icon
			name={icon}
			--width="1.5em"
			on:mousedown={onIconClick}
			style="cursor: {onIconClick ? 'pointer' : 'initial'}; margin-right: 1em"
		/>
	{/if}
	{#if options && focus}
		<ul transition:slide>
			{#each options as option}
				<li on:mousedown={() => (value = option)}>{option}</li>
			{:else}
				<li style="text-align: center;">...</li>
			{/each}
		</ul>
	{/if}
</label>

<style lang="scss">
	ul {
		overflow-y: auto;
		max-height: 15em;
		position: absolute;
		top: calc(100% + 0.6em);
		list-style: none;
		font-weight: bold;
		left: 1em;
		right: 1em;
		border: 1px solid currentColor;
		border-radius: 1em;
		z-index: 10;

		&::-webkit-scrollbar {
			display: none;
		}
	}

	ul li {
		cursor: pointer;
		padding: 1em;
		transition-property: background-color;

		&:hover {
			background-color: rgba(var(--primary), 0.15);
		}
	}

	label {
		position: relative;
		display: flex;
		border: 1px solid rgb(var(--primary));
		border-radius: 3em;

		& > :global(svg) {
			margin: 1em;
		}

		&:not(.empty),
		&:focus-within {
			p {
				top: 0;
			}
		}
	}

	p {
		position: absolute;
		background-color: white;
		padding: 0 0.5em;
		top: 50%;
		border-radius: 1em;
		left: 1em;
		transform: translateY(-50%);
		transition-property: top;
		pointer-events: none;
	}

	input {
		border: none;
		width: 100%;
		padding: 1em 1.5em;
		background: none;
		border-radius: inherit;
		outline: none;
		font: inherit;
		color: inherit;
	}
</style>
