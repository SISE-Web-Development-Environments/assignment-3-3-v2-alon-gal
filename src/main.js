import Vue from "vue";
import App from "./App.vue";
import VueAxios from "vue-axios";
import axios from "axios";
axios.defaults.withCredentials = true;

import routes from "./routes";
import VueRouter from "vue-router";
Vue.use(VueRouter);

const router = new VueRouter({
  routes,
});

import Vuelidate from "vuelidate";
import "bootstrap/dist/css/bootstrap.css";
import "bootstrap-vue/dist/bootstrap-vue.css";
import {
  FormGroupPlugin,
  FormPlugin,
  FormInputPlugin,
  ButtonPlugin,
  CardPlugin,
  DropdownPlugin,
  NavbarPlugin,
  FormSelectPlugin,
  AlertPlugin,
  ToastPlugin,
  LayoutPlugin,
  SpinnerPlugin,
  NavPlugin,
  VBTooltipPlugin,
  IconsPlugin,
  ModalPlugin,
  AvatarPlugin,
  LinkPlugin
} from "bootstrap-vue";
[
  FormGroupPlugin,
  FormPlugin,
  FormInputPlugin,
  ButtonPlugin,
  CardPlugin,
  DropdownPlugin,
  NavbarPlugin,
  FormSelectPlugin,
  AlertPlugin,
  ToastPlugin,
  LayoutPlugin,
  SpinnerPlugin,
  NavPlugin,
  VBTooltipPlugin,
  IconsPlugin,
  ModalPlugin,
  AvatarPlugin,
  LinkPlugin
].forEach((x) => Vue.use(x));
Vue.use(Vuelidate);
Vue.use(SpinnerPlugin);
Vue.use(NavPlugin);
Vue.use(DropdownPlugin);
Vue.use(VBTooltipPlugin);
Vue.use(IconsPlugin);
Vue.use(ModalPlugin);
Vue.use(AvatarPlugin);
Vue.use(LinkPlugin);
axios.interceptors.request.use(
  function(config) {
    // Do something before request is sent
    return config;
  },
  function(error) {
    // Do something with request error
    return Promise.reject(error);
  }
);

// Add a response interceptor
axios.interceptors.response.use(
  function(response) {
    // Do something with response data
    return response;
  },
  function(error) {
    // Do something with response error
    return Promise.reject(error);
  }
);

Vue.use(VueAxios, axios);
import VueCookies from 'vue-cookies';
Vue.use(VueCookies);
Vue.config.productionTip = false;

const shared_data = {
  username: localStorage.username,
  photoUrl: localStorage.photoUrl,
  login(username,photoUrl) {
    localStorage.setItem("username", username);
    this.username = username;
    localStorage.setItem("photoUrl", photoUrl);
    this.photoUrl = photoUrl;
    console.log("login", this.username);
  },
  logout() {
    console.log("logout");
    localStorage.removeItem("username");
    localStorage.removeItem("photoUrl");
    this.username = undefined;
    this.photoUrl = undefined;
  },
};
console.log(shared_data);
// Vue.prototype.$root.store = shared_data;

new Vue({
  router,
  data() {
    return {
      store: shared_data,
    };
  },
  methods: {
    toast(title, content, variant = null, append = false) {
      this.$bvToast.toast(`${content}`, {
        title: `${title}`,
        toaster: "b-toaster-top-center",
        variant: variant,
        solid: true,
        appendToast: append,
        autoHideDelay: 3000,
      });
    },
  },
  render: (h) => h(App),
}).$mount("#app");
