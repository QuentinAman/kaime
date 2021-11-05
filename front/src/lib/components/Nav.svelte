<script>
	import Link from './Link.svelte';
	import Icon from './Icon.svelte';

	export let open = false;
	export let path = '';

	/**
	 * @type {Record<string, { icon: Link["$$prop_def"]["icon"], text: string }>}
	 */
	export let links = {};
</script>

<nav class:open>
	<Icon name="Cross" on:click={() => (open = false)} />
	<ul>
		{#each Object.keys(links) as href}
			<li>
				<Link current={href === path} {href} icon={links[href].icon}>
					{links[href].text}
				</Link>
			</li>
		{/each}
	</ul>
	<p>Kaïme</p>
</nav>

<style lang="scss">
	nav {
		position: fixed;
		display: flex;
		flex-direction: column;
		background-color: rgb(var(--primary));

		top: 0;
		bottom: 0;
		right: 0;
		left: 0;
		transform: translateX(100%);
		color: white;
		transition-property: transform;
		z-index: 99999;

		&.open {
			transform: translateX(0);
		}

		& > :global(svg) {
			cursor: pointer;
			width: 1.5em;
			margin: 1em;
			color: white;
		}
	}

	ul {
		flex: 1;
	}

	p {
		padding: 0.25em 1em;
		font-weight: 900;
		font-size: 1.5em;
		text-align: center;
	}

	@media (min-width: 768px) {
		nav {
			left: initial;
		}
	}
</style>
