/**
 * @type {import("@sveltejs/kit").GetSession}
 */
export const getSession = (request) => {
	console.log(request.headers.cookie);

	return {
		user: {}
	};
};
