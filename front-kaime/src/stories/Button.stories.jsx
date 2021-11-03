import Button from "../components/Button.vue";
import { action } from "@storybook/addon-actions";

export default {
  component: Button,
  title: "Components/Button",
};

const Template = ({ slot, ...args }) => ({
  components: { Button },
  setup: () => ({ args, slot }),
  template: '<Button @click="action" v-bind="args">{{ slot }}</Button>',
  methods: { action: action("@click") },
});

export const Default = Template.bind({});
Default.args = {
  slot: "Text",
};

export const Reverted = Template.bind({});
Reverted.args = {
  slot: "Text",
  reverted: true,
};
