import Logo from "../components/Logo.vue";

export default {
  component: Logo,
  title: "Components/Logo",
};

const Template = () => ({
  components: { Logo },
  template: "<Logo />",
});

export const Default = Template.bind({});
