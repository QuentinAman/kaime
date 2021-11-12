<script>
	import { slide } from 'svelte/transition';

	export let submit = async () => null;
	export let heading = '';
	export let visible = !heading;

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

<form class:heading class:visible on:submit|preventDefault={handle}>
	{#if visible}
		<fieldset transition:slide|local>
			<slot {submitting} />
		</fieldset>
	{/if}
	{#if heading}
		<h1 on:click={() => (visible = !visible)}>{heading}</h1>
	{/if}
</form>

<style lang="scss">
	fieldset {
		border: none;
		display: grid;
		gap: var(--gap, 1.5em);
		margin-top: 1.5em;
	}

	form {
		position: relative;
		background-color: white;

		&.heading {
			border: 1px solid currentColor;
			border-radius: 2em;
			padding: 2em;
			text-align: center;
		}

		h1 {
			cursor: pointer;
			position: absolute;
			white-space: nowrap;
			overflow: hidden;
			text-overflow: ellipsis;
			left: 1em;
			right: 1em;
			top: 1em;
			background-color: inherit;

			transform: translateY(-50%);
			border-radius: 1em;
			padding: 0 0.5em;
			border: 1px solid transparent;

			transition-property: top, left, right, border-color, transform;
		}

		&.visible {
			h1 {
				top: 0;
				left: 25%;
				right: 25%;
				border-color: currentColor;
				transform: translateY(-55%);
			}
		}
	}
</style>
