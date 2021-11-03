import Input from "../components/Input.vue";

export default {
  component: Input,
  title: "Components/Input",
};

const Template = (args) => ({
  components: { Input },
  setup: () => ({ args }),
  template: "<Input v-bind=args />",
});

export const Default = Template.bind({});
Default.args = {
  value: "Value",
};

export const Placeholder = Template.bind({});
Placeholder.args = {
  placeholder: "Placeholder",
  value: "Value",
};

export const WithIcon = Template.bind({});
WithIcon.args = {
  value: "Value",
  icon: "Cross",
}

export const PlaceholderWithIcon = Template.bind({});
PlaceholderWithIcon.args = {
  placeholder: "Placeholder",
  value: "Value",
  icon: "Cross",
}
