import { parseCookie } from '$lib/functions';
import { API } from '$lib/utils';

/**
 * @type {import("@sveltejs/kit").GetSession}
 */
export const getSession = async (request) => {
	const { token } = parseCookie(request.headers.cookie);

	if (token) API.headers.Authorization = `Bearer ${token}`;
	else delete API.headers.Authorization;

	const user = await API.get('/users/self');

	return { user: user || null };
};
