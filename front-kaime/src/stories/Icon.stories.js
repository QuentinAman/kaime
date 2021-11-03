import Icon from "../components/Icon.vue";

export default {
  component: Icon,
  title: "Components/Icon",
};

const Template = (args) => ({
  components: { Icon },
  setup: () => ({ args }),
  template: '<Icon v-bind="args"/>',
});

export const Burger = Template.bind({});
Burger.args = {
  name: "Burger",
};

export const Logout = Template.bind({});
Logout.args = {
  name: "Logout",
};

export const Cross = Template.bind({});
Cross.args = {
  name: "Cross",
};

export const Arrow = Template.bind({});
Arrow.args = {
  name: "Arrow",
}

export const Time = Template.bind({});
Time.args = {
  name: "Time",
}

export const User = Template.bind({});
User.args = {
  name: "User",
}

export const Graphic = Template.bind({});
Graphic.args = {
  name: "Graphic",
}

