import { API } from '$lib/utils';

/**
 * @param {string} token
 */
export const getSelf = async (token) => {
	if (token) API.headers.Authorization = `Bearer ${token}`;
	else delete API.headers.Authorization;

	const user = await API.get('/users/self');

	if (!user) return null;

	user.workingTimes = [];

	return user;
};
