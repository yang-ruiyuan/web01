import Vue from "vue"
import VueRouter from "./vue-router"
import routes from "./routes"

// 使用Vue.use就会调用install方法
Vue.use(VueRouter)  //让Vue去使用VueRouter这个插件
// Router中一个插件     中间件   body-parser   Nginx 
// 如果自己要写一个插件，在vue中必须通过vue.use来使用这个插件
// 这个插件中必须有一个install 
// install方法中第一个参数是Vue构造器


export default new VueRouter({
    mode:"history",   // hash  history
    routes
})