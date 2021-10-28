export class DateFormat {
	static format(date) {
		return `${date.getFullYear()}-${
			date.getMonth() + 1
		}-${date.getDate()}T${date.getHours()}:${date.getMinutes()}`;
	}

	static formatFr(date) {
		const time = new Date(date).toLocaleDateString("fr", {
			weekday: "long",
			day: "numeric",
			month: "long",
			year: "numeric",
			hour: "2-digit",
			minute: "2-digit",
			second: "2-digit",
		});
		return `${time.charAt(0).toUpperCase()}${time.slice(1)}`;
	}
}
