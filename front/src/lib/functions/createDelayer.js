export const createDelayer = (ms = 1500) => {
	let timeout;

	const clear = () => (timeout = clearTimeout(timeout));

	const delay = (callback) => {
		clear();
		timeout = setTimeout(() => {
			callback();
			clear();
		}, ms);
	};

	return { clear, delay };
};
