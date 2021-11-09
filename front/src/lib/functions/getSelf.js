import { API } from '$lib/utils';

/**
 * @param {string} token
 */
export const getSelf = async (token) => {
	if (token) API.token = token;
	else delete API.headers.Authorization;

	const user = await API.get('/self');

	if (!user) return null;

	user.clock = await API.get('/self/clock');
	user.workingTimes = await API.get('/self/workingtimes');

	return user;
};
