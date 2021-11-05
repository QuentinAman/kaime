<script>
	import Icon from './Icon.svelte';
	import {slide} from 'svelte/transition';

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
	<input bind:value on:focus={() => focus = true} on:blur={() => focus = false}/>
	{#if icon}
		<Icon name={icon} on:mousedown={onIconClick} style="cursor: {onIconClick ? "pointer" : "initial"}"/>
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

<style>

	ul::-webkit-scrollbar {
		display: none;
	}

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
	}

	ul li {
		cursor: pointer;
		padding: 1em;
		transition-property: background-color;
	}

	ul li:hover {
		background-color: rgba(var(--primary), 0.15);
	}

	label {
		position: relative;
		display: flex;
		border: 1px solid rgb(var(--primary));
		border-radius: 3em;
	}

	label > :global(svg) {
		width: 1em;
		margin: 1em;
	}

	label:not(.empty) p,
	label:focus-within p {
		top: 0;
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
	}

	input {
		border: none;
		width: 100%;
		padding: 1em 2em;
		background: none;
		border-radius: inherit;
		outline: none;
		font: inherit;
		color: inherit;
	}
</style>
