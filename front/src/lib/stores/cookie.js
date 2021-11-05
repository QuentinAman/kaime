import { browser } from '$app/env';
import { writable } from 'svelte/store';

function getCookie() {
	if (!browser) return {};
	return document.cookie.split('; ').reduce((a, pair) => {
		const [key, value] = pair.split('=');
		a[key] = value;
		return a;
	}, {});
}

function setCookie(object) {
	if (!browser) return;
	const cookies = getCookie();

	Object.keys({ ...cookies, ...object }).forEach((key) => {
		if (key in object) document.cookie = `${key}=${object[key]}; SameSite=None; Secure`;
		else document.cookie = `${key}=; Max-Age=-99999`;
	});
}

const makeCookie = () => {
	const { subscribe, set } = writable(getCookie());

	return {
		subscribe,
		set: (v) => {
			setCookie(v);
			set(getCookie());
		}
	};
};

export const cookie = makeCookie();
