import { browser } from '$app/env';
import { parseCookie } from '$lib/functions';
import { writable } from 'svelte/store';

function getCookie() {
	if (!browser) return {};

	return parseCookie(document.cookie);
}

function setCookie(object) {
	if (!browser) return;
	const cookies = getCookie();

	console.log(object);

	Object.keys({ ...cookies, ...object }).forEach((key) => {
		if (key in object) document.cookie = `${key}=${object[key]}; SameSite=None; Secure`;
		else document.cookie = `${key}=; Max-Age=-99999`;
	});
}

const makeCookie = () => {
	const { subscribe, set, update } = writable(getCookie());

	return {
		subscribe,
		deleteItem(key) {
			update((v) => {
				delete v[key];
				setCookie(v);
				return getCookie();
			});
		},
		set: (v) => {
			setCookie(v);
			set(getCookie());
		}
	};
};

export const cookie = makeCookie();
