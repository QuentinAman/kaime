<script>
	import { page } from '$app/stores';

	import Header from '$lib/components/Header.svelte';

	import '../global.css';
</script>

{#if !["/login", "/register"].includes($page.path)}
	<Header />
{/if}
<slot />
