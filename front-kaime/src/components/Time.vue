<script setup>
const props = defineProps({
  hours: Number,
  minutes: Number,
});

const now = new Date();
now.setHours(props.hours, props.minutes);
</script>

<template>
  <div class="container">
    <p>{{ now.toLocaleTimeString().replace(/:[^:]+$/, "") }}</p>
    <div class="bar" />
  </div>
</template>

<style scoped>
.container {
  position: relative;
  display: flex;
  align-items: center;
}

p {
  position: absolute;
  font-weight: 900;
}

.bar {
  flex: 1;
  height: 1px;
  background-color: currentColor;
  margin-left: 6ch;
}
</style>
