<script context="module" lang="ts">
  import type { ErrorLoadInput, LoadOutput } from "@sveltejs/kit";

  export async function load({error, status}: ErrorLoadInput) {
    const output: LoadOutput = {};
    output.props = {error, status};
    return output;
  }
</script>

<script>
  import { snacks } from "$lib/stores";

  export let error;
  export let status;

  snacks.danger(error.message);
</script>

<div class="error">
  <h1>{status}</h1>
</div>

<style>

  @keyframes flipflop {
    from {
      transform: rotateY(0);
    }
    to {
      transform: rotateY(360deg);
    }
  }

  .error {
    animation: flipflop infinite 2500ms linear;
    perspective-origin: -170%;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 70vh;
  }

  h1 {
    font-size: 10em;
  }
</style>