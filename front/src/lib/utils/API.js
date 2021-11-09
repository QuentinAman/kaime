import { browser } from '$app/env';
import { snacks } from '$lib/stores';

const { VITE_HOST, VITE_PORT, PROD, VITE_PROTOCOL } = import.meta.env;

/**
 * @param {string} endpoint
 * @param {RequestInit} init
 */
const request = async (endpoint, init = {}) => {
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

		if (json.message) {
			snacks.normal(json.message);
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
	 */
	static get(endpoint) {
		return request(endpoint, { method: 'GET' });
	}

	/**
	 * @param {string} endpoint
	 * @param {*} body
	 */
	static post(endpoint, body) {
		return request(endpoint, { method: 'POST', body });
	}

	/**
	 * @param {string} endpoint
	 * @param {*} body
	 */
	static patch(endpoint, body) {
		return request(endpoint, { method: 'PATCH', body });
	}

	/**
	 * @param {string} endpoint
	 * @param {*} body
	 */
	static put(endpoint, body) {
		return request(endpoint, { method: 'PUT', body });
	}

	/**
	 * @param {string} endpoint
	 * @param {*} body
	 */
	static delete(endpoint, body) {
		return request(endpoint, { method: 'DELETE', body });
	}
}
