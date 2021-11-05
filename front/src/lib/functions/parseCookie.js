/**
 * @param {string} cookie
 */
export const parseCookie = (cookie) => {
	if (!cookie) return {};

	return cookie.split('; ').reduce((a, pair) => {
		const [key, value] = pair.split('=');
		a[key] = value;
		return a;
	}, {});
};
