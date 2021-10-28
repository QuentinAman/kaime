export class API {
	static async fetch(endpoint, method = "get", body = {}) {
		return await fetch(`http://localhost:4000/api/${endpoint}`, {
			method: method,
			headers: {
				"Content-Type": "application/json",
			},
			body: method == "get" ? null : JSON.stringify(body),
		}).then((res) => res.json());
	}
	static async fetchJson(dataName) {
		return (await import(`../json/${dataName}.json`)).default;
	}
}
