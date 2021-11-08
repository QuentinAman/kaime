<script context="module" lang="ts">
	import type { LoadInput, LoadOutput } from '@sveltejs/kit';

	const pages = ['/login', '/register'];

	export async function load({ page, session }: LoadInput) {
		const output: LoadOutput = {};

		const redirect = (endpoint) => {
			output.status = 302;
			output.redirect = endpoint;
		};

		if (!session.user && !pages.includes(page.path)) {
			redirect('/login');
		} else if (session.user && pages.includes(page.path)) {
			redirect('/account');
		}

		return output;
	}
</script>

<script>
	import { page, session } from '$app/stores';
	import Header from '$lib/components/Header.svelte';
	import Modals from '$lib/components/Modals.svelte';
	import Snacks from '$lib/components/Snacks.svelte';

	import '../global.css';
</script>

{#if !pages.includes($page.path)}
	<Header path={$page.path} />
{/if}
<!-- <pre>{JSON.stringify($session, null, 2)}</pre> -->
<slot />

<Modals />
<Snacks />
