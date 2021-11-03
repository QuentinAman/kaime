<script setup>
import Icon from "./Icon.vue";
defineProps({
  href: String,
  icon: String,
  current: Boolean,
});
</script>

<template>
  <a :href="href" :class="{ current, icon }">
    <div v-if="icon">
      <Icon :name="icon" />
    </div>
    <slot />
  </a>
</template>

<style scoped>
a {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgb(var(--primary));
  color: white;
  padding: 1em;
  gap: 0.5em;
  text-decoration: none;
  font-size: 1.5em;
  font-weight: 700;

  transition-property: background-color;
}

a.current {
  color: rgb(var(--primary));
  background-color: white;
}

a.icon {
  justify-content: space-between;
}

div {
  border: 0.15em solid currentColor;
  border-radius: 0.2em;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 1.25em;
  height: 1.25em;
  padding: 0.15em;
}

div svg {
  width: 100%;
  height: 100%;
}
</style>
