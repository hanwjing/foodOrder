import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import Vueresource from 'vue-resource'


//注册vue-resource
Vue.use(Vueresource)

// import VeeValidate from 'vee-validate'
// import {Validator } from 'vee-validate'
// Vue.use(VeeValidate);
// import './validate.js'


Vue.http.options.emulateJSON = true
Vue.http.options.root = "http://47.106.165.138:8899"


//引入mintui并注册组件
import Mint from 'mint-ui'
Vue.use(Mint)
//引入mintui的样式
import 'mint-ui/lib/style.css'
import './assets/Iconfont/font/iconfont.css'

//引入MUI的样式
import 'MUI/css/mui.css'
import 'MUI/css/icons-extra.css'
import "./assets/layui/css/layui.css"

//日期格式化插件
import moment from 'moment'

//引入缩略图插件
import  vuepreview from 'vue-preview'
Vue.use(vuepreview)


//定义一个全局时间过滤器
Vue.filter('dataFormatter',function(msg){
  return moment(msg).format('YYYY-MM-DD HH:mm:ss')
})
Vue.filter('contentFormatter',function(msg){
  if(msg.length<40)
    return msg;
  return msg.substring(0,40)+"...";
})
Vue.filter('contentFormatter2',function(msg){
  if(msg.length<28)
    return msg;
  return msg.substring(0,28)+"...";
})

Vue.config.productionTip = false;


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
