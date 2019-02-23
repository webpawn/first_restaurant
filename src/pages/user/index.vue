<template>
    <div class='userContainer'>
        <div class="user_info">
            <img :src="user.avatarUrl" alt="">
            <div class='user_detail'>
                <h3>{{user.nickName}}</h3>
                <span>{{user.gender==1?'男':'女'}}</span><br>
                <span>{{user.city}}</span>
            </div>
        </div>
        <div class='saleabout'>
            <div>
                <img src="/static/ic_menu_choice_pressed.png" alt="">
                <span>订单中心</span> 
                <img src="/static/right.png" alt="" class='right'>
            </div>
            <div>
                <img src="/static/icon_collect_checked.png" alt="">
                <span>我的评价</span>
                <img src="/static/right.png" alt="" class='right'>
            </div>
        </div>
        <div class='appabout'>
            <div>
                <img src="/static/ic_menu_me_pressed.png" alt="">
                <span>关于我们</span>
                <img src="/static/right.png" alt="" class='right'>
            </div>
            <div>
                <img src="/static/ic_menu_topic_pressed.png" alt="">
                <span>设置中心</span>
                <img src="/static/right.png" alt="" class='right'>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    computed:{
        user(){
            console.log(this.$store.getters.user)
            return this.$store.getters.user
        }
    }
}
</script>

<style lang="stylus" scoped>
    .userContainer
        background:#eee
        .user_info
            display:flex
            width:100%
            background:white
            border-bottom 1px solid #eee
            img 
                width:150rpx
                height 150rpx
                border-radius:50%
                padding:20rpx
            .user_detail
                margin-left:20rpx
                span 
                    color:#666
                    font-size:26rpx
        .saleabout,.appabout
            margin: 20rpx 0
            background:white
            font-size:30rpx
            div
                padding:20rpx 0
                border-bottom 1px solid #eee
                img
                    width:30rpx
                    height 30rpx
                    padding:20rpx
                    margin-right:30rpx
                    vertical-align middle
                .right
                    float:right
        
        

</style>
