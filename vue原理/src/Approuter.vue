<template>
  <div id="app">
   <router-link to="/home">首页</router-link>   
    <br>
    <router-link to="/about">关于</router-link>
    <router-view></router-view>
  </div>
</template>


<script>
export default {
  name:"app",
  mounted(){
    // console.log(this.$route);
  }
}
</script>