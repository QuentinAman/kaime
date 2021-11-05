export const createDelayer = (ms = 1500) => {
	let timeout;

	const clear = () => (timeout = clearTimeout(timeout));

	const delay = (callback) => {
		clear();
		setTimeout(() => {
			callback();
			clear();
		}, ms);
	};

	return { clear, delay };
};
