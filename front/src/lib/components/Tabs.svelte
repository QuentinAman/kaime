<script>
import { setContext } from "svelte";
import { writable } from "svelte/store";

let tabs = [];

let current = 0;

const currentTab = writable(tabs[current]);

const setTab = (name) => {
  tabs = [...tabs, name];
}

const removeTab = (name) => {
  tabs = tabs.filter(tab => tab !== name);
}

setContext("tabs", {
  set: setTab,
  remove: removeTab,
  current: currentTab,
}); 

$: $currentTab = tabs[current];

</script>

<ul>
  {#each tabs as tab, i}
    <li class:active={current === i} on:click={() => current = i}>{tab}</li>
  {/each}
</ul>

<slot/>

<style lang="scss">
  ul {
    display: flex;
    align-items: center;
    li {
      cursor: pointer;
      user-select: none;
      text-align: center;
      font-weight: bold;
      font-size: 1.5em;
      opacity: 25%;
      flex: 1;
      border-bottom: 4px solid rgb(var(--primary));
      padding: 0.4em;
      &.active {
        opacity: 1;
      }
    }
  }
</style>