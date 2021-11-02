<script setup>
import { onUnmounted } from "vue";
import { ref } from "@vue/reactivity";

const getDegrees = () => {
  const now = new Date();
  const toDegree = (n) => n * 360 - 90;

  return {
    hour: toDegree(now.getHours() / 12),
    minute: toDegree(now.getMinutes() / 60),
  };
};

const init = getDegrees();

const hour = ref(init.hour);
const minute = ref(init.minute);

let interval = setInterval(() => {
  const degrees = getDegrees();

  hour.value = degrees.hour;
  minute.value = degrees.minute;
}, 1000);

onUnmounted(() => clearInterval(interval));
</script>

<template>
  <div class="container">
    <div class="dots">
      <div class="dot" />
      <div class="dot" />
    </div>
    <div class="circle">
      <div class="bar" :style="`--rotate: ${hour}deg`" />
      <div class="center"></div>
      <div class="bar" :style="`--rotate: ${minute}deg`" />
    </div>
  </div>
</template>

<style scoped>
.container {
  width: max-content;
}

.circle {
  position: relative;

  border: 0.5em solid currentColor;
  width: 6em;
  height: 6em;
  border-radius: 50%;

  display: flex;
  justify-content: center;
  align-items: center;
}

.bar {
  position: absolute;

  height: 0.5em;
  width: 1.5em;
  background-color: currentColor;
  border-radius: 1em;
  transform-origin: left;
  top: 50%;
  left: 50%;
  transform: translateY(-50%) rotate(var(--rotate, 0deg));
  transition-property: transform;
}

.bar:last-of-type {
  width: 2.25em;
}

.dots {
  display: flex;
  justify-content: center;
  gap: 1em;
  margin-bottom: 0.5em;
}

.center,
.dot {
  width: 1em;
  height: 1em;
  background-color: currentColor;
  border-radius: 50%;
}

.center {
  position: absolute;
  width: 0.75em;
  height: 0.75em;
}
</style>
