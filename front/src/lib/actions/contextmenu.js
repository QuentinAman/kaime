/**
 * @param {HTMLElement} node
 * @param {*} callback
 */
export const contextmenu = (node, callback) => {
	node.addEventListener('contextmenu', callback);
	node.addEventListener('dblclick', callback);

	return {
		destroy() {
			node.removeEventListener('contextmenu', callback);
			node.removeEventListener('dblclick', callback);
		}
	};
};
