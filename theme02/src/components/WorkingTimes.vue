<script setup>
import { ref } from "@vue/reactivity";
import { onMounted } from "@vue/runtime-core";

import { API } from "../utils/API";
import WorkingTime from "./WorkingTime.vue";

let workingTimes = ref([]);

async function getWorkingTimes() {
  workingTimes.value = await API.fetchJson("workingTimes");
}

onMounted(getWorkingTimes);

let displayTimes = ref(false);
</script>

<template>
  <div id="bar" @click="displayTimes = !displayTimes">
    <h2>WorkingtimesManager</h2>
    <img
      src="/arrow.svg"
      width="16"
      :class="displayTimes ? '--show' : '--not-show'"
    />
  </div>
  <div v-if="displayTimes" id="workingtimes">
    <div v-for="workingTime in workingTimes" :key="workingTime.id">
      <WorkingTime :working-time="workingTime" :is-creating="false" />
    </div>
  </div>
  <WorkingTime style="margin-bottom: 5em" :is-creating="true" />
</template>

<style scoped>
#bar {
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: lightgrey;
  padding: 0em 3em;
  border-radius: 10px 10px 0 0;
  border: 1px black solid;
  position: relative;
  color: darkslategrey;
  user-select: none;
  min-width: 50em;
}

#bar > h2 {
  margin-right: 1em;
}

#bar > img {
  transition: transform 100ms ease;
  position: absolute;
  top: 50%;
  right: 1em;
  transform-origin: top;
}

.--show {
  transform: rotate(90deg) translateY(-50%);
}

.--not-show {
  transform: rotate(-90deg) translateY(-50%);
}

#workingtimes {
  border: 1px solid black;
  border-top: none;
  border-radius: 0 0 10px 10px;
  overflow: hidden;
}
</style>
