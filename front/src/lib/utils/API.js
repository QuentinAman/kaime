const { VITE_HOST, VITE_PORT } = import.meta.env;

/**
 * @param {string} endpoint
 * @param {RequestInit} init
 */
const request = async (endpoint, init = {}) => {
	const { data, errors } = await fetch(
		`http://${VITE_HOST}:${VITE_PORT}/api/${endpoint.replace(/^\/+/, '')}`,
		{
			method: init.method,
			headers: API.headers,
			body: JSON.stringify(init.body)
		}
	).then((res) => res.json());

	if (errors) {
		console.log(errors);
		throw errors;
	}

	return data;
};

export class API {
	static headers = {
		'Content-Type': 'application/json'
	};

	/**
	 * @param {string} endpoint
	 */
	static get(endpoint) {
		return request(endpoint, { method: 'get' });
	}

	/**
	 * @param {string} endpoint
	 * @param {*} body
	 */
	static post(endpoint, body) {
		return request(endpoint, { method: 'post', body });
	}

	/**
	 * @param {string} endpoint
	 * @param {*} body
	 */
	static patch(endpoint, body) {
		return request(endpoint, { method: 'patch', body });
	}

	/**
	 * @param {string} endpoint
	 * @param {*} body
	 */
	static put(endpoint, body) {
		return request(endpoint, { method: 'put', body });
	}

	/**
	 * @param {string} endpoint
	 * @param {*} body
	 */
	static delete(endpoint, body) {
		return request(endpoint, { method: 'delete', body });
	}
}
