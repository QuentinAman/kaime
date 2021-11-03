import Nav from "../components/Nav.vue";

export default {
  components: { Nav },
  title: "Components/Nav",
};

const Template = (args) => ({
  components: { Nav },
  setup: () => ({ args }),
  template: '<Nav v-bind="args" />',
});

export const Default = Template.bind({});
Default.args = {
  open: true,
  location: "/working-times",
  links: {
    "/working-times": {
      text: "Vos Temps",
      icon: "Time",
    },

    "/graphics": {
      text: "Graphiques",
      icon: "Graphic",
    },

    "/account": {
      text: "Compte",
      icon: "User",
    },
  },
};
