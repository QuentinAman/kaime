<script context="module" lang="ts">
	import type { LoadInput, LoadOutput } from '@sveltejs/kit';

	const pages = ['/login', '/register'];

	export async function load({ page, session }: LoadInput) {
		const output: LoadOutput = {};

		if (!session.user && !pages.includes(page.path)) {
			output.status = 302;
			output.redirect = '/login';
		}

		return output;
	}
</script>

<script>
	import { page } from '$app/stores';
	import Header from '$lib/components/Header.svelte';

	import '../global.css';
</script>

{#if !pages.includes($page.path)}
	<Header path={$page.path} />
{/if}
<slot />
