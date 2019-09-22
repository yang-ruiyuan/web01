import Vue from 'vue'
import Vuex from './vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    age: 100
  },
  // getters中虽然是一个方法，但是用时，当作属性   // 说白了，就是vue中data中的computed
  getters: {
    myAge(state) {
      return state.age + 100
    },

  },
  // 改变状态：异步请求数据  事件 
  mutations: {
    add(state, payload) {
      state.age += payload
    },
    asyncSub(state, payload) {
      state.age -= payload
    }
  },
  actions: {
    asyncSub({ commit }, payload) {
      setTimeout(() => {
        commit("asyncSub", payload)
      }, 2000)
    }
  }
})
