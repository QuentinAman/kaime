<script context="module" lang="ts">
	import type { LoadInput, LoadOutput } from '@sveltejs/kit';
	import { cookie } from '$lib/stores';

	const pages = ['/login', '/register'];

	cookie.subscribe(($cookie) => {
		if ($cookie.token) API.token = $cookie.token;
	});

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
	import '../global.css';

	import { page, session } from '$app/stores';
	import Header from '$lib/components/Header.svelte';
	import Modals from '$lib/components/Modals.svelte';
	import Snacks from '$lib/components/Snacks.svelte';

	import { API } from '$lib/utils';
</script>

{#if $session.user && !pages.includes($page.path)}
	<Header path={$page.path} />
{/if}
<slot />

<Modals />
<Snacks />
