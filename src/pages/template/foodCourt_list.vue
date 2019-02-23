<template>
    <div class='courtContainer'>
        <div v-for='item in newsList' :key='item.id'>
            <div class='avatar_date'>
                <div class='avatarBox'>
                    <img src="/static/food_pic1.jpg" alt="">
                </div>
                <span>{{item.ctime}}</span>
            </div>
            <p class='title'>{{item.title}}</p>
            <img class='detail_img' :src="item.img_url" alt="">
            <p class='content'>{{item.content}}</p>
            <div class='view_star_container'>
                <img src="/static/ic_menu_me_pressed.png" alt="">
                <span>{{item.view}}</span>
                <img src="/static/icon_collect_checked.png" alt="">
                <span>{{item.point}}</span>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            newsList:[]
        }
    },
    created(){
        this.$https.request({
            url:this.$interfaces.getNews,
            method:'get'
        }).then(res => {
            console.log(res)
            this.newsList=res.data
        }).catch(error => {
            console.log(error)
        })
    }
}
</script>

<style lang="stylus" scoped>
    .homeContainer
        display:flex
        flex-direction:column
        div
            .avatar_date
                margin:10rpx
                .avatarBox
                    display:inline-block
                    vertical-align:middle
                    width:60rpx
                    height:60rpx
                    border-radius:50%
                    overflow:hidden
                    img 
                        width:60rpx
                        height:60rpx
                span 
                    padding-left:20rpx
                    font-size:28rpx
            .title
                font-size:30rpx
                font-weight:bolder 
                padding:10rpx
            .detail_img
                width:100%
                height:450rpx
            .content
                font-size:26rpx
                font-weight:light
                text-indent:26rpx
            .view_star_container
                border-bottom:1px solid #eee
                img 
                    width:25rpx
                    height:25rpx
                    margin:10rpx
                    vertical-align:middle
                span 
                    font-size:20rpx

</style>
