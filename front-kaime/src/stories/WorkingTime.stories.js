import WorkingTime from "../components/WorkingTime.vue";

export default {
  component: WorkingTime,
  title: "Components/WorkingTime",
};

const Template = (args) => ({
  components: { WorkingTime },
  setup: () => ({ args }),
  template: "<WorkingTime v-bind=args />",
});

const now = new Date();

const start = now.toLocaleString();
now.setHours(now.getHours() + 6);
const end = now.toLocaleString();

export const Default = Template.bind({});
Default.args = {
  data: {
    start,
    end,
  },
};
