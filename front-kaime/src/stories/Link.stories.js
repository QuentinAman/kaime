import Link from "../components/Link.vue";

export default {
  components: { Link },
  title: "Components/Link",
};

const Template = ({ slot, ...args }) => ({
  components: { Link },
  setup: () => ({ args, slot }),
  template: '<Link v-bind="args">{{ slot }}</Link>',
});

export const Default = Template.bind({});
Default.args = {
  slot: "Text",
  href: "/path",
};

export const Current = Template.bind({});
Current.args = {
  slot: "Text",
  href: "/path",
  current: true,
};

export const Icon = Template.bind({});
Icon.args = {
  slot: "Mon Compte",
  href: "/account",
  current: false,
  icon: "User",
};
