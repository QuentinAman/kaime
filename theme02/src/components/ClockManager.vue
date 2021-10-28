<script setup>
import { ref } from "@vue/reactivity";
import { onMounted } from "@vue/runtime-core";

import { API } from "../utils/API";
import { DateFormat } from "../utils/DateFormat";

let clock = ref([]);

async function getClock() {
  const result = await API.fetchJson("clock");
  clock.value = result;
}

async function refresh() {}

onMounted(getClock);
</script>

<template>
  <div id="clock">
    <div>{{ DateFormat.formatFr(clock.time) }}</div>
    <div v-if="clock.status" class="--active">Active</div>
    <div v-else class="--inactive">Inactive</div>
    <button @click="refresh">
      {{ clock.status ? "Arrêter l'horloge" : "Lancer l'horloge" }}
    </button>
  </div>
</template>

<style scoped>
#clock {
  display: flex;
  align-items: center;
  justify-content: space-around;
  width: 100vw;
}
button {
  background: lightgray;
  cursor: pointer;
  outline: none;
  border: 1px darkgray solid;
  transition: all 200ms ease;
  padding: 1em 2em;
  border-radius: 10px;
}
button:hover {
  background: darkgray;
  border: 1px lightgray solid;
  color: white;
}
.--inactive {
  background: rgba(255, 0, 0, 0.5);
  border-radius: 10px;
  padding: 1em 2em;
  transition: background 200ms ease;
}
</style>