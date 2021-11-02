<script setup lang="ts">
import { CSSProperties } from "@vue/runtime-dom";

const props = defineProps({
  text: String,
  handle: () => {},
  backgroundColor: String,
});

let style: CSSProperties = {
  backgroundColor: props.backgroundColor || "blue",
};
</script>

<template>
  <button :style="style" @click="() => handle || console.log('test')">
    {{ text || "test" }}
  </button>
</template>

<style scoped>
button {
  outline: none;
  border: 2px solid grey;
  padding: 1em 2em;
  border-radius: 10px;
  transition: transform 100ms ease;
  cursor: pointer;
  text-transform: uppercase;
  font-weight: 600;
  color: grey;
}
button:hover {
  transform: scale(1.1);
}
</style>