import { browser } from '$app/env';
import { snacks } from '$lib/stores';

const { VITE_HOST, VITE_PORT, PROD, VITE_PROTOCOL } = import.meta.env;

/**
 * @param {string} endpoint
 * @param {RequestInit} init
 */
const request = async (endpoint, init = {}, notify = true) => {
	try {
		let host = browser ? location.hostname : VITE_HOST;

		const res = await fetch(
			`${VITE_PROTOCOL}://${host}:${VITE_PORT}/api/${endpoint.replace(/^\/+/, '')}`,
			{
				method: init.method,
				headers: API.headers,
				body: JSON.stringify(init.body)
			}
		);

		const json = await res.json();

		if (json.message && notify) {
			let type = 'message';

			if (res.status >= 200 && res.status < 300) type = 'success';
			else if (res.status >= 400) type = 'danger';

			snacks.push(json.message, type);
		}

		if (json.errors) {
			throw new Error(json.message);
		}

		return json.data;
	} catch (error) {
		snacks.danger(error.message);
		throw error;
	}
};

export class API {
	static headers = {
		'Content-Type': 'application/json'
	};

	static set token(value) {
		this.headers.Authorization = `Bearer ${value}`;
	}

	static get token() {
		return this.headers.Authorization;
	}

	/**
	 * @param {string} endpoint
	 * @param {boolean=} notify
	 */
	static get(endpoint, notify) {
		return request(endpoint, { method: 'GET' }, notify);
	}

	/**
	 * @param {string} endpoint
	 * @param {*=} body
	 * @param {boolean=} notify
	 */
	static post(endpoint, body, notify) {
		return request(endpoint, { method: 'POST', body }, notify);
	}

	/**
	 * @param {string} endpoint
	 * @param {*=} body
	 * @param {boolean=} notify
	 */
	static patch(endpoint, body, notify) {
		return request(endpoint, { method: 'PATCH', body }, notify);
	}

	/**
	 * @param {string} endpoint
	 * @param {*=} body
	 * @param {boolean=} notify
	 */
	static put(endpoint, body, notify) {
		return request(endpoint, { method: 'PUT', body }, notify);
	}

	/**
	 * @param {string} endpoint
	 * @param {*=} body
	 * @param {boolean=} notify
	 */
	static delete(endpoint, body, notify) {
		return request(endpoint, { method: 'DELETE', body }, notify);
	}
}
