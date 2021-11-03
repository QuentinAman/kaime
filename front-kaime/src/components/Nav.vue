<script setup>
import Link from "./Link.vue";
import Icon from "./Icon.vue";

defineProps({
  open: Boolean,
  location: String,
  links: {
    type: Object,
    default: {},
  },
});
</script>

<template>
  <nav :class="{ open }">
    <Icon name="Cross" @click="open = false" />
    <ul>
      <li :key="i" v-for="(href, i) in Object.keys(links)">
        <Link
          :current="href === location"
          :href="href"
          :icon="links[href].icon"
          >{{ links[href].text }}</Link
        >
      </li>
    </ul>
    <p>Kaïme</p>
  </nav>
</template>

<style scoped>
nav {
  position: fixed;
  display: flex;
  flex-direction: column;
  background-color: rgb(var(--primary));

  top: 0;
  bottom: 0;
  right: 0;
  left: 0;
  transform: translateX(100%);
  color: white;
  transition-property: transform;
}

nav.open {
  transform: translateX(0);
}

nav > svg {
  cursor: pointer;
  width: 1.5em;
  margin: 1em;
  color: white;
}

ul {
  flex: 1;
}

p {
  padding: 0.25em 1em;
  font-weight: 900;
  font-size: 1.5em;
  text-align: center;
}

@media (min-width: var(--tablet)) {
  nav {
    left: initial;
  }
}
</style>
