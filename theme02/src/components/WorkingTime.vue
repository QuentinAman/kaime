<script setup>
import { watch } from "@vue/runtime-core";
import { DateFormat } from "../utils/DateFormat";

const props = defineProps({
  workingTime: Object,
  isCreating: Boolean,
});

const updatedWorkingTime = props.workingTime || {
  name: "",
  start: DateFormat.format(new Date()),
  end: DateFormat.format(new Date()),
};

function createWorkingTimeasync() {}
function deleteWorkingTimeasync() {}
function updateWorkingTimeasync() {}

watch(updatedWorkingTime, () => console.log(updatedWorkingTime));
</script>

<template>
  <div id="workingtime">
    <input type="datetime-local" v-model="updatedWorkingTime.start" />
    <input type="datetime-local" v-model="updatedWorkingTime.end" />
    <div v-if="isCreating" id="handle">
      <img src="/plus.svg" width="20" />
    </div>
    <div v-else id="handle">
      <img src="/edit.svg" width="20" />
      <img src="/bin.svg" width="20" />
    </div>
  </div>
</template>

<style scoped>
#workingtime {
  background-color: whitesmoke;
  display: flex;
  justify-content: space-around;
  align-items: center;
  padding: 1em;
}

input {
  margin: 0;
  padding: 0.5em 0;
  width: 100%;
  font-size: 1.2em;
  outline: none;
  border: none;
  background: none;
}

#handle {
  display: flex;
  width: 10em;
  justify-content: space-evenly;
  align-items: center;
  padding: 0 0.5em;
}

#handle > * {
  cursor: pointer;
  background: none;
  transition: background 100ms ease;
  border-radius: 100%;
  padding: 0.2em;
}
#handle > *:hover {
  background: darkgray;
}
</style>