import Card from "../components/Card.vue";

export default {
  component: Card,
  title: "Components/Card",
};

const Template = (args) => ({
  components: { Card },
  setup: () => ({ args }),
  template: "<Card v-bind=args />",
});

export const Default = Template.bind({});
Default.args = {
  user: {
    name: "John Doe",
    email: "johndoe@example.com"
  },
};
