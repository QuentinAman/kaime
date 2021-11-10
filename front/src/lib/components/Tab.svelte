<script>
import { getContext, onDestroy } from "svelte";

  export let name;
  const {set, remove, current} = getContext("tabs");
  set(name);

  onDestroy(() => {
    remove(name);
  });

</script>

{#if $current == name}
  <slot />
{/if}