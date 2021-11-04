<script>
import Button from "$lib/components/Button.svelte";

  import Header from "$lib/components/Header.svelte";
  import Input from "$lib/components/Input.svelte";

  let firstname = "";
  let lastname = "";
  let email = "";

</script>

<main>
  <form>
    <Input bind:value={firstname} placeholder="Prénom"/>
    <Input bind:value={lastname} placeholder="Nom"/>
    <Input bind:value={email} placeholder="Email"/>
    <Button>Changer de mot de passe</Button>
  </form>
  <footer>
    <Button>Supprimer mon compte</Button>
  </footer>
</main>

<style>

  main {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 5em 0em; 
  }

  form {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 2em;
  }

</style>

