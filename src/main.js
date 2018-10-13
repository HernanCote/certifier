import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import index from "./store/index";
import Web3 from "web3";

Vue.config.productionTip = false;

window.addEventListener("load", () => {
  if (typeof web3 !== "undefined") {
    web3 = new Web3(web3.currentProvider);
  } else {
    console.warn("MetaMask was not detected");
  }
});

new Vue({
  router,
  index,
  render: h => h(App)
}).$mount("#app");
