import { writable } from 'svelte/store';

const initialValue = {
	modal: null,
	props: {}
};

const makeModals = () => {
	const { subscribe, set } = writable(initialValue);

	const open = (modal, props = {}) => {
		set({ modal, props });
	};

	const close = () => {
		set(initialValue);
	};

	return {
		subscribe,
		set,
		open,
		close
	};
};

export const modals = makeModals();
