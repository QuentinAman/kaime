import Button from "../components/Button.vue";

export default {
	component: Button,
	title: "Components/Button",
};

const Template = (args) => ({
	components: { Button },
	setup() {
		return { args };
	},
	template: '<Button v-bind="args" />',
});

export const Default = Template.bind({});
Default.args = { backgroundColor: "", text: "" };

export const Primary = Template.bind({});
Primary.args = { backgroundColor: "#ff0", text: "Button" };
