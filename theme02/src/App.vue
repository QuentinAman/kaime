<script setup>
import User from "./components/User.vue";
</script>

<template>
  <header>
    <User />
  </header>
  <main>
    <div>
      <router-view />
    </div>
  </main>
</template>

<style>
body {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
main {
  display: flex;
  align-items: center;
  flex-flow: column;
  min-width: max-content;
}
</style>
