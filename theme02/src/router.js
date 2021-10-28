import { createWebHistory, createRouter } from "vue-router";

import WorkingTimes from "./components/WorkingTimes.vue";
import ClockManager from "./components/ClockManager.vue";
import ChartManager from "./components/ChartManager.vue";

const routes = [
	{
		path: "/workingTimes",
		component: WorkingTimes,
		name: "workingTime",
	},
	{
		path: "/clock",
		component: ClockManager,
		name: "clock",
	},
	{
		path: "/chart",
		component: ChartManager,
		name: "chart",
	},
];

export default createRouter({
	history: createWebHistory(),
	routes: routes,
});
