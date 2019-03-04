import Vue from "vue";
import Router from "vue-router";
// import Login from "@/components/login/login.vue"
// import Register from "@/components/login/register.vue"
// import SellDetail from "@/components/sells/sellDetail.vue"
// import FoodDetail from "@/components/sells/fooddetail.vue"
// import NewsList from "@/components/news/NewsList.vue"
// import NewsInfo from "@/components/news/NewsInfo.vue"
// import OrderSeat from "@/components/orderseat/orderinfo.vue"

//路由懒加载
const HomeContainer = () => import('@/views/HomeContainer.vue')
const SelfCenterContainer = () => import('@/views/SelfCenterContainer.vue')
const OrderSeatContainer = () => import('@/views/OrderSeatContainer.vue')
const OrderListContainer =()=> import('@/views/OrderlistContainer.vue')

const Login = ()=> import('@/components/login/login.vue')
const Register = ()=> import('@/components/login/register.vue')
const SellDetail = ()=> import('@/components/sells/sellDetail.vue')
const FoodDetail = ()=> import('@/components/sells/fooddetail.vue')
const NewsList = ()=> import('@/components/news/NewsList.vue')
const NewsInfo = ()=> import('@/components/news/NewsInfo.vue')
const OrderSeat = ()=> import('@/components/orderseat/orderinfo.vue')


Vue.use(Router);
import mui from 'MUI/js/mui.js'
export default new Router({
  routes: [
      {
          path:"/",
          redirect:"/home"
      },
      {
          path: "/home",
          component:HomeContainer,
          meta:{
              title:"首页"
          }
      },
      {
          path: "/myorder",
          component:OrderListContainer,
          meta:{
              title:"我的订单"
          },
          beforeEnter:(to,from,next)=> {
              if(localStorage.getItem('username')){
                  next()
              }else{
                  mui.alert('请先登录')
                  next('/login')
              }
          }
      },
      {
          path: "/selfcenter",
          component:SelfCenterContainer,
          meta:{
              title:"个人中心"
          }
      },
      {
          path: "/orderseat",
          component:OrderSeatContainer,
          meta:{
              title:"预定座位"
          },
      },
      {
          path: "/login",
          component:Login,
          meta:{
              title:"登录"
          }
      },
      {
          path: "/register",
          component:Register,
          meta:{
              title:"注册新用户"
          }
      },
      {
          path:"/home/selldetail/:sname/:sid",
          component:SellDetail,
          meta:{
              title:''
          }
      },
      {
          path:"/home/fooddetail/:fid",
          component:FoodDetail,
          meta:{
              title:'食品详情'
          }
      },
      {
          path:"/home/newslist",
          component:NewsList,
          meta:{
              title:'新闻资讯'
          }
      },
      {
          path:"/home/newsinfo/:id",
          component:NewsInfo,
          meta:{
              title:'资讯详情'
          }
      },
      {
          path:"/orderseat/orderinfo/:id",
          component:OrderSeat,
          meta:{
              title:'预定座位'
          }
      },
  ],
  linkActiveClass:"mui-active"
});
