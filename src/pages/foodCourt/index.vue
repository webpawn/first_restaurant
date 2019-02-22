<template>
    <div class='homeContainer'>
        <swiper 
            autoplay indicator-dots   indicator-color='white' indicator-active-color='#960007' interval='3000'>
            <swiper-item>
                <img src="/static/1.jpg" alt="">
            </swiper-item>
            <swiper-item>
                <img src="/static/1.jpg" alt="">
            </swiper-item>
        </swiper>
        <div class='foodCourt_list'>
            <div class='plate'>美食广场</div>
            <foodCourtList/>
        </div>

    </div>
</template>

<script>
import foodCourt_list from '../template/foodCourt_list.vue'
export default {
    components:{
        foodCourtList:foodCourt_list
    }
}
</script>

<style lang="stylus" scoped>
    .homeContainer
        swiper
            width:100%
            height:400rpx
            img
                width:100%
                height:100%
    .foodCourt_list
        .plate
            width:100%
            line-height:80rpx
            text-align:center
            background:#970007
            color:white
            font-size:30rpx
            margin: 10rpx 0
</style>
