<template>
    <div class='courtContainer'>
        
        <div class='avatar_date'>
            <div class='avatarBox'>
                <img src="/static/food_pic1.jpg" alt="">
            </div>
            <span>2018-12-12</span>
        </div>
        <p class='title'>美味三文鱼</p>
        <img class='detail_img' src="/static/food_pic2.jpg" alt="">
        <p class='content'>美味三文鱼美味三文鱼美味三文鱼美味三文鱼美味三文鱼美味三文鱼美味三文鱼美味三文鱼...</p>
        <div class='view_star_container'>
            <img src="/static/ic_menu_me_pressed.png" alt="">
            <span>66</span>
            <img src="/static/icon_collect_checked.png" alt="">
            <span>88</span>
        </div>
    </div>
</template>

<script>
export default {
    
}
</script>

<style lang="stylus" scoped>
    .homeContainer
        display:flex
        flex-direction:column
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
