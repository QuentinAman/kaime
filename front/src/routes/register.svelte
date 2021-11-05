<script>
  import Button from "$lib/components/Button.svelte";
  import Input from "$lib/components/Input.svelte";
  import Logo from "$lib/components/Logo.svelte";

  let email = "";
  let password = "";
  let firstname = "";
  let lastname = "";

</script>

<main>
  <h1>Kaïme</h1>
  <Logo />
  <form>
    <Input bind:value={email} placeholder="Email"/>
    <Input bind:value={firstname} placeholder="Prénom"/>
    <Input bind:value={lastname} placeholder="Nom"/>
    <Input type="password" bind:value={password} placeholder="Mot de passe"/>
    <Button>Créer mon compte</Button>
    <p>Vous avez déjà un compte ?</p>
    <a href="/login">Se connecter</a>
  </form>
  <footer>Made with ❤ by Epitech</footer>
</main>

<style lang="scss">

  main {
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 100vh;
    gap: 1em;
  }

  :global(.container) {
    justify-content: center;
    margin-top: -1em;
    padding: 1em;
  }

  h1 {
    justify-content: center;
    color: rgb(var(--primary));
    font-size: 3em;
    font-weight: 900;
    padding: 1em;
  }

  form {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 1em;
    padding: 1em 20vw;

    :global(button) {
      margin: 1.5em 0 0 0;
    }
  }

  a {
    margin-top: -1em;
    text-decoration: underline;
    color: rgb(var(--primary));
  }

  footer {
    margin-top: auto;
    margin-bottom: 2em;
  }
</style>