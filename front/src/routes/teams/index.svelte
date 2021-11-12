<script context="module" lang="ts">
	import { API } from '$lib/utils';

	import type { LoadInput, LoadOutput } from '@sveltejs/kit';

	const getTeams = () => API.get('/admin/teams');

	export async function load({ page, session }: LoadInput) {
		const output: LoadOutput = {};

		if (session?.user.role !== 2) {
			output.error = new Error("Cette page n'existe pas.");
			output.status = 404;
		} else {
			output.props = {
				teams: await getTeams()
			};
		}

		return output;
	}
</script>

<script>
	import Button from '$lib/components/Button.svelte';
	import Form from '$lib/components/Form.svelte';
	import Team from '$lib/components/Team.svelte';
	import Capitalize from '$lib/components/Capitalize.svelte';
	import { scale } from 'svelte/transition';
	import { flip } from 'svelte/animate';
	import { expoOut } from 'svelte/easing';
	import { snacks } from '$lib/stores';

	export let teams = [];

	let visible = false;
	let name = '';

	const createTeam = async () => {
		const team = await API.post('/admin/teams', { name });

		teams = [...teams, team];
		name = '';
		visible = false;
	};
</script>

<main>
	<h1>Les équipes</h1>
	<Form heading="Créer une équipe" bind:visible submit={createTeam} let:submitting>
		<Capitalize bind:value={name} placeholder="Nom de l'équipe" autofocus />
		<Button type="submit" disabled={submitting}>Créer</Button>
	</Form>
	<ul>
		{#each teams as team (team.id)}
			<li transition:scale|local animate:flip={{ easing: expoOut, duration: 800 }}>
				<Team
					bind:team
					disabled={team.disabled}
					update={async () => {
						const res = await API.patch(`/admin/teams/${team.id}`, { team });
						console.log(res);
						snacks.success("L'équipe à été mis à jour !");
					}}
					remove={async () => {
						team.disabled = true;
						try {
							await API.delete(`/admin/teams/${team.id}`);
							teams = teams.filter((t) => t !== team);
						} catch (e) {
							team.disabled = false;
						}
					}}
				/>
			</li>
		{/each}
	</ul>
</main>

<style lang="scss">
	main {
		padding: 5vw;
	}

	ul {
		display: grid;
		grid-template-columns: repeat(auto-fill, minmax(20em, 1fr));
		margin-top: 2em;
		gap: 2em;
	}

	h1 {
		text-align: center;
		margin-bottom: 2em;
	}
</style>
