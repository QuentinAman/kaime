import Button from "../components/Button.vue";
import { action } from "@storybook/addon-actions";

export default {
  component: Button,
  title: "Components/Button",
};

const Template = (args) => ({
  components: { Button },
  setup: () => ({ args }),
  template: '<Button @click="action">{{args.$slot}}</Button>',
  methods: { action: action("@click") }
});

export const Default = Template.bind({});
Default.args = {
  $slot: "Value",
};
