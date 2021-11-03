<script setup>
import Icon from "../components/Icon.vue";
defineProps({
  placeholder: String,
  value: String,
  icon: String,
});
</script>

<template>
  <label :class="{ empty: !value }">
    <p v-if="placeholder">{{ placeholder }}</p>
    <input type="text" v-model="value" />
    <Icon v-if="icon" :name="icon" @click="$emit('icon-click', $event)" />
  </label>
</template>

<style scoped>
svg {
  width: 1em;
  margin: 1em;
}

label {
  position: relative;
  display: flex;
  border: 1px solid rgb(var(--primary));
  border-radius: 1em;
}

label:not(.empty) p,
label:focus-within p {
  top: 0;
}

p {
  position: absolute;
  background-color: white;
  padding: 0 0.5em;
  top: 50%;
  border-radius: 1em;
  left: 0.5em;
  transform: translateY(-50%);
  transition-property: top;
}

input {
  border: none;
  width: 100%;
  padding: 1em;
  background: none;
  border-radius: inherit;
  outline: none;
  font: inherit;
  color: inherit;
}
</style>
