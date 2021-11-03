import Time from "../components/Time.vue";

export default {
  component: Time,
  title: "Components/Time",
};

const Template = (args) => ({
  components: { Time },
  setup: () => ({ args }),
  template: `<Time v-bind=args />`,
});

const now = new Date();

export const Default = Template.bind({});
Default.args = {
  hours: now.getHours(),
  minutes: now.getMinutes(),
};
