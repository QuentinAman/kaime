<script>
	// @ts-nocheck

	export let data = {};
	export let left = '0';

	const getPercent = (date) => {
		const start = new Date(date);
		start.setHours(0, 0, 0, 0);
		const end = new Date(start);
		end.setDate(end.getDate() + 1);

		date = new Date(date);
		date = end - date;

		return date / (end - start);
	};

	/**
	 * @param {"start" | "end"} prop
	 * @param {DragEvent} e
	 */
	const drag = (prop, e) => {
		// /**
		//  * @type {HTMLElement}
		//  */
		// const container = e.target.parentNode;
		// const rect = container.getBoundingClientRect();
		// console.log(prop, e.clientY, rect.x);
	};

	$: top = 1 - getPercent(data.start);
	$: bottom = getPercent(data.end);
</script>

<div class="container" style="top: {top * 100}%; bottom: {bottom * 100}%; left: {left};">
	<div class="content">
		<div class="handle" draggable="true" on:drag={(e) => drag('start', e)} />
		<div class="handle" draggable="true" on:drag={(e) => drag('end', e)} />
		<p class="time">
			{new Date(data.start).toLocaleTimeString().replace(/:[^:]+$/, '')}
		</p>
		<p class="description">{data.description || 'Description...'}</p>
	</div>
</div>

<style>
	.container {
		background-color: rgba(var(--primary), 0.35);
		position: absolute;
		left: 0;
		right: 0;
		border-radius: 1em;
		border-left: 0.75em solid currentColor;
		display: flex;
		flex-direction: column;
		cursor: move;

		transition-property: top, bottom;
	}

	.handle {
		position: absolute;
		left: 0;
		right: 0;
		height: 1em;
		cursor: row-resize;
		z-index: 10;
	}

	.handle:first-of-type {
		top: 0;
	}

	.handle:last-of-type {
		bottom: 0;
	}

	.content {
		position: relative;
		display: flex;
		justify-content: space-between;
		align-items: flex-start;
		gap: 1em;
		flex: 1;
		height: 100%;
		overflow: hidden;
	}

	.time {
		padding: 0.5em 1em;
		border-radius: 1em;
		background-color: white;
		margin: 1em;
	}

	.description {
		text-align: right;
		font-weight: 700;
		flex: 1;
		margin: 1em;
	}
</style>
