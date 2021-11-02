import Button from "../components/Button.vue";

export default {
  component: Button,
  title: "Components/Button",
};

const Template = (args) => ({
  components: { Button },
  setup: () => ({ args }),
  template: "<Button>{{args.$slot}}</Button>",
});

export const Default = Template.bind({});
Default.args = {
  $slot: "Value",
};
