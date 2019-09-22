let Vue   //install  中的Vue和这个一样码？？？ 

// forEach是用来循环一个对象
const forEach = (obj, callback) => {
    // 把数组中的每一个key得到  objc[key] 
    // key  value  ----> callback
    Object.keys(obj).forEach(key => {
        callback(key, obj[key])
    })
}


//当没写Store是  不会打印 main  app 明白了 嘿嘿 因为Vuex中 有Store store中调用了Store  
class Store {
    constructor(options) {
        // 此时$store指向了  Store 在Store上面 挂载state 
        // this._s = options.state

        // 在vuex中状态变了，视图也是刷新  new Vue({data:{xxx}})
        // vuex中响应式原理就是靠 new Vue
        this._s = new Vue({  // app.state
            data: {
                // 只有data中的数据才是响应式
                state: options.state
            }
        })

        //实现getters原理
        let getters = options.getters || {}
        // console.log(getters);
        // this.getters = getters; //不是直接挂载到 getters上 这样只会拿到整个 函数体
        this.getters = {};
        // console.log(Object.keys(getters))  // ["myAge","myName"]
        Object.keys(getters).forEach((getterName) => {
            // console.log(getterName)  // myAge
            // 将getterName 放到this.getters = {}中
            // console.log(this.state);
            // Object.defineProperty(this.getters, getterName, {
            //     // 当你要获取getterName（myAge）会自动调用get方法
            //     // 箭头函数中没有this               
            //     get: () => {
            //         return getters[getterName](this.state)
            //     }
            // })
            forEach(getters, (getterName, value) => {
                Object.defineProperty(this.getters, getterName, {
                    get: () => {
                        return value(this.state)
                    }
                })
            })
        })
        // console.log(this.getters);

        //实现mutations
        let mutations = options.mutations || {}
        // console.log(mutations);
        this.mutations = {};
        // Object.keys(mutations).forEach(mutationName => {
        //     // console.log(mutationName);
        //     this.mutations[mutationName] = (payload) => {
        //         mutations[mutationName](this.state, payload)
        //     }
        // })

        forEach(mutations, (mutationName, value) => {
            this.mutations[mutationName] = (payload) => {
                value(this.state, payload)
            }
        })

        // actions的原理 
        let actions = options.actions || {}
        this.actions = {};
        forEach(actions, (actionName, value) => {
            this.actions[actionName] = (payload) => {
                value(this, payload)
            }
        })
    }
    // type是actions的类型  
    dispatch = (type, payload) => {
        this.actions[type](payload)
    }
    // vuex   commit一个mutaions    dispatch一个actions
    // type是mutations的类型
    commit = (type, payload) => {
        this.mutations[type](payload)
    }
    // 用来获取state  this.$store.state.age
    get state() {
        return this._s.state
    }
}


const install = _vue => {
    Vue = _vue;
    Vue.mixin({
        beforeCreate() {
            if (this.$options && this.$options.store) {
                //找到根组件 main 上面挂一个$store
                this.$store = this.$options.store
                // console.log(this.$store);

            } else {
                this.$store = this.$parent && this.$parent.$store
            }

        }
    })
}

export default {
    install,
    Store
}


