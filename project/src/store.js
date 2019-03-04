import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);
let car = JSON.parse(localStorage.getItem("car"));

export default new Vuex.Store({
  state: {
    //购物车的数据
    car:car || []
  },
  mutations: {
    addToCar(state,obj){
      //flag用来标识当前state中有没有obj对应id数据
      let flag = false;
      //从state.car方法中找一条数据
      state.car.some(item=>{
        if(item.id === obj.id){
          flag = true;
          item.count = parseInt(item.count) + parseInt(obj.count)
        }
      })
      //state中没有id对应的数据
      if(flag == false){
        state.car.push(obj)
      }
      //console.log(state.car)
      localStorage.setItem("car",JSON.stringify(state.car))
    },
    //更新vuex中的数据
    updateCar(state,obj){
      state.car.forEach(item=>{
        if(item.id == obj.id){
          if(obj.hasOwnProperty('count')){
            item.count = obj.count
          }
          if(obj.hasOwnProperty('isselectd')){
            item.selected = obj.isselectd
          }
        }
      })
      localStorage.setItem("car",JSON.stringify(state.car))
    },
    deleteCar(state,id){
      let idx = state.car.findIndex(item=>{
        return item.id = id;
      })
      state.car.splice(idx,1);
      localStorage.setItem("car",JSON.stringify(state.car))
    }
  }
  ,
  actions: {},
  getters: {
    getAllCount(state){
      let count = 0;
      state.car.forEach(item=>{
        count = parseInt(count) + parseInt(item.count) ;
      })
      return count
    },
    //封装每一个商品所对应的购买数量
    getGoodsCount(state){
      let obj = {}
      state.car.forEach(item=>{
        obj[item.id] = item.count
      })
      return obj
    },
    //获取每个商品对应的是否选中的信息
    getSelectedGood(state){
      let obj = {}
      state.car.forEach(item=>{
        obj[item.id] = item.selected
      })
      return obj
    },
    getSelectGoodMsg(state){
      let sumcount = 0
      let sumprice = 0
      state.car.forEach(item=>{
        if(item.selected){
          sumcount = parseInt(sumcount) + parseInt(item.count)
          sumprice += item.count*item.price
        }
      })
      let obj = {
        sumcount,
        sumprice
      }
      return obj
    }
  }
});
