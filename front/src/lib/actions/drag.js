/**
 * @param {TouchEvent} e
 */
const touch = (e) => {
	e.preventDefault();
	const t = e.targetTouches[0];
	return { x: t.clientX, y: t.clientY };
};

/**
 * @param {MouseEvent} e
 */
const mouse = (e) => {
	e.preventDefault();
	return { x: e.clientX, y: e.clientY };
};

/**
 * @param {HTMLElement} node
 * @param {(mouse: { x: number, y: number, offsetY: { top: number, bottom: number } }) => void} callback
 */
export const drag = (node, callback) => {
	let clicked = false;
	let offsetY = { top: 0, bottom: 0 };

	let end;

	const setOffsetY = (y) => {
		offsetY.top = y;
		offsetY.bottom = offsetY.top - node.clientHeight;
	};

	const touchMove = (e) => (end = callback({ ...touch(e), offsetY }));
	const mouseMove = (e) => clicked && (end = callback({ ...mouse(e), offsetY }));

	const up = () => {
		if (end) end();
		clicked = false;
		end = undefined;
	};

	/**
	 * @param {TouchEvent} e
	 */
	const touchStart = (e) => {
		if (e.target !== e.currentTarget) return;
		setOffsetY(e.targetTouches[0].clientY - node.getBoundingClientRect().y);
	};

	/**
	 * @param {MouseEvent} e
	 */
	const mousedown = (e) => {
		if (e.target !== e.currentTarget) return;
		setOffsetY(e.offsetY);
		clicked = true;
	};

	node.addEventListener('touchmove', touchMove, { passive: false });
	node.addEventListener('touchstart', touchStart, { passive: false });
	node.addEventListener('mousedown', mousedown);
	addEventListener('touchend', up, { passive: false });
	addEventListener('mouseup', up);
	addEventListener('mousemove', mouseMove);

	return {
		destroy() {
			node.removeEventListener('touchmove', touchMove);
			node.removeEventListener('touchstart', touchStart);
			node.removeEventListener('mousedown', mousedown);
			removeEventListener('touchend', up);
			removeEventListener('mouseup', up);
			removeEventListener('mousemove', mouseMove);
		}
	};
};
