<script setup>
import { ref } from "@vue/reactivity";
import { useRoute } from "vue-router";
import { API } from "../utils/API";

const user = ref({
  username: "",
  email: "",
});

const currentTab = useRoute();

async function login() {
  const log = await API.fetch(
    `users?username=${user.value.username}&email=${user.value.email}`
  );

  console.log(log);
}

async function register() {
  const log = await API.fetch("users", "POST", {
    user: {
      username: user.value.username,
      email: user.value.email,
    },
  });

  console.log(log);
}

const routes = [
  {
    name: "ClockManager",
    alias: "clock",
    path: "/clock",
  },
  {
    name: "ChartManager",
    alias: "chart",
    path: "/chart",
  },
  {
    name: "WorkingtimeManager",
    alias: "workingTime",
    path: "/workingTimes",
  },
];
</script>

<template>
  <div id="log">
    <div>
      <input type="text" v-model="user.username" placeholder="Username" />
      <input type="text" v-model="user.email" placeholder="Email" />
    </div>
    <div id="handle">
      <button @click="login">Se connecter</button>
      <button @click="register">Créer son compte</button>
      <button>Modifier son compte</button>
      <button>Supprimer son compte</button>
    </div>
  </div>
  <nav>
    <h1>
      {{ username }}
    </h1>
    <ul>
      <li
        v-for="route in routes"
        :class="currentTab.name === route.alias && '--selected'"
        :key="route.name"
      >
        <router-link :to="route.path">{{ route.name }}</router-link>
      </li>
    </ul>
  </nav>
</template>

<style scoped>
#log {
  display: flex;
  flex-direction: column;
}
#log > #handle {
  margin-top: 1em;
}
#log input {
  outline: none;
  border: 1px solid grey;
  padding: 1em 1em;
  border-radius: 10px;
  background: none;
  margin: 0 0.5em;
}
#log > #handle > button {
  outline: none;
  background: lightgrey;
  border-radius: 10px;
  cursor: pointer;
  margin: 0 0.5em;
  padding: 1em 2em;
  border: 1px solid darkgray;
  transition: all 100ms ease;
}
#log > #handle > button:hover {
  background: darkgray;
  color: white;
}
ul {
  display: flex;
  justify-content: space-around;

  background: whitesmoke;
  margin: 4em 0;
  padding: 0;
}
li {
  list-style: none;
  width: 100%;
  padding: 1em 0;
  font-size: 1.3em;
  cursor: pointer;
  transition: 100ms ease;
  transition-property: background border-radius;
  border-radius: 0;
}
li > * {
  text-decoration: none;
  color: darkgray;
}
.--selected {
  background: darkgray;
  border-radius: 10px;
}
.--selected > * {
  color: whitesmoke;
}
</style>
