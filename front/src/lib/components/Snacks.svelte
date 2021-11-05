<script>
	import { snacks } from '$lib/stores/snacks';
	import { slide } from 'svelte/transition';
	import Icon from './Icon.svelte';

	/**
	 * @type {Record<string, Icon["$$prop_def"]["name"]>}
	 */
	const names = {
		normal: 'Notification',
		danger: 'Danger',
		success: 'Success',
		warning: 'Warning'
	};
</script>

<ul>
	{#each $snacks as snack (snack._id)}
		<li transition:slide>
			<div>
				<Icon --width="1.5em" --height="1.5em" name={names[snack.type]} />
				<Icon --width="1.5em" name="Cross" click={() => snacks.remove(snack._id)} />
			</div>
			<p>
				{snack.message}
			</p>
		</li>
	{/each}
</ul>

<style lang="scss">
	ul {
		position: fixed;

		bottom: 0;
		right: 0;

		display: flex;
		flex-direction: column-reverse;
		padding: 2em;

		width: 25em;
		z-index: 99999;
	}

	div {
		display: flex;
		justify-content: space-between;
		margin-bottom: 0.5em;
	}

	p {
		font-size: 1.25em;
		word-wrap: break-word;
	}

	li {
		box-shadow: 0 0 0.25em rgba(var(--primary), 0.25);
		padding: 1em;
		background-color: white;
		border-radius: 1em;
		width: 100%;
		margin-top: 1em;
	}
</style>
