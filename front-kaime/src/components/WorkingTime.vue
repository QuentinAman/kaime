<script setup>
import { ref } from "@vue/reactivity";

const props = defineProps(["data"]);

/**
 * @param {Date} date
 */
const getPercent = (date) => {
  const start = new Date(date);
  start.setHours(0, 0, 0, 0);
  const end = new Date(start);
  end.setDate(end.getDate() + 1);

  date = new Date(date);
  date = end - date;

  return date / (end - start);
};

const top = ref(1 - getPercent(props.data.start));
const bottom = ref(getPercent(props.data.end));

/**
 * @param {"start" | "end"} prop
 * @param {DragEvent} e
 */
const drag = (prop, e) => {
  // /**
  //  * @type {HTMLElement}
  //  */
  // const container = e.target.parentNode;
  // const rect = container.getBoundingClientRect();
  // console.log(prop, e.clientY, rect.x);
};
</script>

<template>
  <div
    class="container"
    :style="`top: ${top * 100}%; bottom: ${bottom * 100}%;`"
  >
    <div class="content">
      <div class="handle" draggable="true" @drag="drag('start', $event)" />
      <div class="handle" draggable="true" @drag="drag('end', $event)" />
      <p class="time">
        {{ new Date(data.start).toLocaleTimeString().replace(/:[^:]+$/, "") }}
      </p>
      <p class="description">{{ data.description || "Description..." }}</p>
    </div>
  </div>
</template>

<style scoped>
.container {
  background-color: rgba(var(--primary), 0.35);
  position: absolute;
  left: 0;
  right: 0;
  border-radius: 1em;
  border-left: 0.75em solid currentColor;
  display: flex;
  flex-direction: column;
  cursor: move;

  transition-property: top, bottom;
}

.handle {
  position: absolute;
  left: 0;
  right: 0;
  height: 1em;
  cursor: row-resize;
  z-index: 10;
}

.handle:first-of-type {
  top: 0;
}

.handle:last-of-type {
  bottom: 0;
}

.content {
  position: relative;
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  gap: 1em;
  flex: 1;
  height: 100%;
  overflow: hidden;
}

.time {
  padding: 0.5em 1em;
  border-radius: 1em;
  background-color: white;
  margin: 1em;
}

.description {
  text-align: right;
  font-weight: 700;
  flex: 1;
  margin: 1em;
}
</style>
