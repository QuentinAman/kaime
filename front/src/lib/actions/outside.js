export const outside = (node, callback) => {
	const mousedown = (e) => {
		if (e.target !== node) callback();
	};

	addEventListener('mousedown', mousedown);

	return {
		destroy() {
			removeEventListener('mousedown', mousedown);
		}
	};
};
