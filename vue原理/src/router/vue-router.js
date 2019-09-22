class HistoryRoute {
    constructor() {
        this.current = null;
    }
}


class VueRouter {
    constructor(options) {
        // console.log(options);
        this.mode = options.mode || "hash";
        this.routes = options.routes || [];
        this.routesMap = this.createMap(this.routes);
        this.history = new HistoryRoute();
        this.init();
    }
    init() {
        if (this.mode === "hash") {
            location.hash ? "" : location.hash = "/";  //#/会加上了 
            // console.log(location.hash);
            window.addEventListener("load", () => {
                this.history.current = location.hash.slice(1)
                // console.log("load-->", this.history.current)
            })
            window.addEventListener("hashchange", () => {
                this.history.current = location.hash.slice(1)
                // console.log("hashchange-->", this.history.current)
            })

        } else {
            //使用history
            // console.log("History");
            location.pathname ? "" : location.pathname = "/";
            window.addEventListener("load", () => {
                this.history.current = location.pathname
                // console.log("load--->", this.history.current)
            })
            window.addEventListener("popstate", () => {
                this.history.current = location.pathname
                // console.log("popstate--->", this.history.current)
            })

        }
    }
    // 把方法写到$router上去
    push() { }
    go() { }
    back() { }

    createMap(routes) {
        return routes.reduce((memo, current) => {
            //meomo刚开始是一个空对象
            memo[current.path] = current.component;
            return memo;
        }, {})
    }
}

VueRouter.install = function (Vue) {
    // console.log(Vue);  //构造器
    // Vue.component() // 全局组件
    Vue.mixin({  //mixin 混入 
        beforeCreate() {
            // console.log(this.$options);  //每一个vue组件  
            // console.log(this.$options);
            //获取根组件  因为根组件下面 有router
            if (this.$options && this.$options.router) {
                // 找到根组件
                // 把当前实例挂载到_root上
                // console.log(this);
                // 把router实例挂载到_router上面
                this._router = this.$options.router
                this._root = this  // main 根组件
                //监控路径的变化 为了让 _router 的变化能及时响应页面的更新，所以又接着又调用了 Vue.uti.defineReactive方法来进行get和set的响应式数据定义。
                Vue.util.defineReactive(this, "xxx", this._router, history)
            } else {
                // console.log(this); //app组件
                this._root = this.$parent._root;
            }
            Object.defineProperty(this, "$router", {
                get() {
                    return this._root._router
                },
                push(){

                }
            })
            Object.defineProperty(this, "$route", {
                get() {
                    return {
                        current: this._root._router.history.current
                    }
                }
            })
        }
    }),
        Vue.component("router-link", {
            props: {
                to: String
            },
            render(h) {
                let mode = this._self._root._router.mode;
                return <a href={mode === 'hash' ? `#${this.to}` : this.to}>{this.$slots.default}</a>
            }
        }),
        Vue.component("router-view", {
            render(h) {
                let current = this._self._root._router.history.current;
                let routesMap = this._self._root._router.routesMap;
                // console.log("...", current);

                return h(routesMap[current])
            }
        })
}

export default VueRouter


/**
 * 第一步 vue.use()调用VueRouter的install
 * 在index.js中 new VueRouter  传入一个对象参数 到constructor  并且将路由格式转换形式
 *
 * 初始化VUeRouter 判断hash  history 
 *给每一个组件 赋予一个方法  或者$router $route
 *   定义方法 go back    数据劫持  $router $route 得到相应的数据
 *  定义全局的router-link  -view 
 * 问题 current刷新后 没出来  并出来 两个... 
 */