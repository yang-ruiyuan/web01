import Vue from 'vue'
import App from './App.vue'
import store from './store'
import router from './router'  


Vue.config.productionTip = false

new Vue({
  name:"main",
  router,  //封装了 router-view  router-link  $router  $route
  store,
  render: h => h(App)
}).$mount('#app')
