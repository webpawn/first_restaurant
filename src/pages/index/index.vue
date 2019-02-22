<template>
    <div class='indexContainer'>
        <img class='indexImg' src="/static/1.jpg" alt="">
        <div class='indexBox'>
          <button 
            class='indexButton' 
            open-type='getUserInfo' 
            @getuserinfo='getUserInfo'
          >先点菜吧</button>
        </div>
    </div>
</template>

<script>
export default {
  data () {
    return {
    }
  },

  methods: {
    getUserInfo(e){
      if(e.mp.detail.userInfo){
          //存储到vuex中
          console.log(e.mp.detail.userInfo);
          this.$store.dispatch('setIsAuthenticated',true);
          this.$store.dispatch('setUser',e.mp.detail.userInfo);
          //获取code
          this.getCode();
          
      }
    },
    getCode(){
      wx.login({
        success: res => {
          console.log(res);
          this.getOpenid(res.code);
        }
      })
    },
    getOpenid(code){
      //获取openid需要三个参数
      const appid='	wx5e560cdc895de182';
      const secret='dafd1de12b554f08aba0f17b34eddb90';
      this.$https
        .request({
        url:this.$interfaces.getOpenid+appid+'/'+secret+'/'+code,
        method:'get'
      })
        .then(res => console.log(res))
        .catch(error => {
            wx.switchTab({
            url:"../home/main"
          })
        })
    }
  }
}
</script>

<style lang='stylus'  scoped>
    .indexContainer
      position:absolute
      width:100%
      height:100%
      .indexImg
        width:100%
        height:100%
      .indexBox
        width:100%
        position:absolute
        bottom:100rpx
        text-align:center
        .indexButton
          width:200rpx
          line-height:80rpx
          font-size:24rpx
      

    
</style>

