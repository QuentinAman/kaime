<template>
  <button @click="$emit('click', $event)"><slot /></button>
</template>

<style scoped>
  button {
    cursor: pointer;
    text-transform: uppercase;
    background-color: #E63946;
    padding: 1em 2em;
    outline: none;
    font: inherit;
    color: white;
    border: none;
    border-radius: 2em;
    transition-property: transform;
  }

  button:hover {
    transform: scale(1.05);
  }

  button:active {
    transform: scale(0.95);
  }
</style>