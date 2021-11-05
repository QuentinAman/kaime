import { getSelf, parseCookie } from '$lib/functions';

/**
 * @type {import("@sveltejs/kit").GetSession}
 */
export const getSession = async (request) => {
	const { token } = parseCookie(request.headers.cookie);

	const user = await getSelf(token);

	return { user };
};
