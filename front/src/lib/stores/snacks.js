import { browser } from '$app/env';
import { writable } from 'svelte/store';
import * as uuid from 'uuid';

const makeSnacks = () => {
	const { subscribe, update } = writable([]);

	let interval;
	let ms = 3000;

	const push = (message, type) => {
		if (!browser) return console.log({ message, type });
		const snack = { _id: uuid.v4(), message, type };
		update((v) => [...v, snack]);

		if (interval) return;

		interval = setInterval(() => {
			update((v) => {
				v = v.slice(1);
				if (!v.length) interval = clearInterval(interval);
				return v;
			});
		}, ms);
	};

	const success = (message) => push(message, 'success');
	const warning = (message) => push(message, 'warning');
	const danger = (message) => push(message, 'danger');
	const normal = (message) => push(message, 'normal');

	const remove = (_id) => {
		update((v) => v.filter((v) => v._id !== _id));
	};

	return {
		subscribe,

		success,
		warning,
		danger,
		normal,

		remove
	};
};

export const snacks = makeSnacks();
