<template>
<div id="app">
    <!-- 100 -->
    <!-- {{this.$store.state.age}}   -->
    <!-- 200 -->
    <!-- {{this.$store.getters.myAge}} -->
    <!-- {{this.$store.getters.myName}} -->

    {{this.$store.state.age}}
    <!-- 同步加 -->
    <button @click="add">Add</button>
    <!-- 异步减 -->
    <button @click="sub">Async Sub</button>
</div>
</template>
<script>
export default {
    name:"app",
    // mounted(){
    //     // console.log(this.$store.state)  // {age: 100}
    //     // this.$store.state.age = 666;   
    //     // console.log(this.$store.state)  // {age: 666}

    //     // 是异步的
    //     setTimeout(()=>{
    //         this.$store.state.age = 666;
    //     },1000)
    //     // 是同步的
    //     // console.log(this.$store.state)
    // },
    methods: {
        add(){
            // alert("hello")
            // commit一个mutations
             this.$store.commit('add',10)
        },
        sub(){
            this.$store.dispatch("asyncSub",10)
        }
    }
}
</script>