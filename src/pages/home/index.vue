<template>
    <div class='homeContainer'>
        <swiper 
            autoplay indicator-dots   indicator-color='white' indicator-active-color='#960007' interval='3000'>
            <swiper-item v-for='item in imgList' :key=item.id>
                <img :src=item.img_url alt="">
            </swiper-item>
            <!-- <swiper-item>
                <img src="/static/1.jpg" alt="">
            </swiper-item> -->
        </swiper>
        
        <div class='todayHot'>
            <p class='title'>今日推荐</p>
            <scroll-view 
                class='scroll-view' 
                :scroll-x="true" @scrolltolower='scrolltolower' 
            >
                <div class='foodItem' v-for='item in foodList' :key=item.id>
                    <img 
                    class='detail_img'
                    :src=item.img_url alt="">
                    <p class='name'>{{item.name}}</p>
                    <p class='sale'>月售{{item.sale}}</p>
                    <div class='price_add_box'>
                        <span>¥{{item.price}}</span>
                        <img src="/static/ic_menu_shoping_pressed.png" alt="" @click='showType'>
                    </div>
                </div>
            </scroll-view>
        </div>

        <div class='foodcategory'>
                <scroll-view class='left' :scroll-y='true'>
                    <div class="iconText" @click='selectitem(index)' v-for='(item,index) in cateList' :class="[index==nowIndex?'active':'']" :key=index >
                        {{item}}
                    </div>
                </scroll-view>
                <div class='right' >
                    <div class='banner'>
                        <img src="/static/1.jpg" alt="">
                    </div>
                    <foodItem 
                        :catetitle='cateList[nowIndex]'
                        :nowindex='nowIndex'
                        @clickHandle='showType'
                        ref='fooditem'
                    ></foodItem>
                </div>
        </div>

        <div v-show='show' class='shopcart'>
            <div @click="showType" class="close">x</div>
            <div class='shopcartitem'>
                <div class='itemimg'>
                    <img src="/static/food_pic1.jpg" alt="">
                </div>
                <div class='itemcontent'>
                    <span class='itemname'>美味套餐</span>
                    <span>¥22</span>
                </div>
                <div class="count">
                    <div @click="reduce" class="cut">-</div>
                    <input class="number" disabled="" v-model="number" />
                    <div @click="add" class="add">+</div>
                </div>
            </div>
            
        </div>
    </div>
    
</template>

<script>
import foodItem from '../template/fooditem'
export default {
    data(){
        return{
            imgList:[],
            cateList:['热销','早餐','正餐','寿司','西餐','饮品'],
            nowIndex:0,
            foodList:[],
            pageSize:null,
            show:false,
            number:1
        }
    },
    components:{
        foodItem
    },
    methods:{
        showType(){
            this.show=!this.show
        },
        selectitem(index){
            this.$refs.fooditem.request(index)
            this.nowIndex=index;
        },
        scrolltolower(){
            if(!this.pageSize){
                this.pageSize=3;
            }else{
                this.pageSize+=3
            }
            this.$https.request({
                url:this.$interfaces.getGoodsList + '?pageSize='+this.pageSize,
                method:"get"
            }).then(res => {
                console.log(res)
                this.foodList=res.data
            }).catch(error => {
                console.log(error)
            })
        },
    },
    created(){
        this.$https.request({
            url:this.$interfaces.getImages,
            method:'get'
        }).then(res => {
            // console.log(res)
            this.imgList=res
        }).catch(error => {
            console.log(error)
        });
        this.scrolltolower()
    }
}
</script>

<style lang="stylus" scoped>
    .homeContainer
        width:100%
        height:100%
        display:flex
        flex-direction:column
        swiper
            width:100%
            height:400rpx
            img
                width:100%
                height:100%
        .todayHot
            .title
                margin:20rpx 10rpx
                font-size:28rpx
                font-weight:bold
            .scroll-view
                margin: 20rpx 0
                border:1px solid red
                width:100%
                white-space: nowrap;
                .foodItem
                    display:inline-block
                    width:300rpx
                    height:360rpx
                    border:1px solid #eee
                    box-shadow:3rpx 3rpx 10rpx #eee
                    margin:0 10rpx
                    .detail_img
                        width:100%
                        height:250rpx
                    .name 
                        font-size:24rpx
                        margin-left:10rpx
                    .sale
                        color:gray
                        font-size:20rpx
                        margin-left:10rpx
                    .price_add_box
                        line-height:30rpx
                        span 
                            color:red
                            font-size:24rpx
                            font-weight:bold
                            margin-left:10rpx
                        img
                            width:30rpx
                            height:30rpx
                            float:right
                            margin-right:10rpx
        .foodcategory 
            display:flex
            .left
                width:162rpx
                height:100%
                text-align:center
                .iconText 
                    line-height: 90rpx;
                    width: 162rpx;
                    height: 90rpx;
                    color: #333;
                    font-size: 28rpx;
                    border-left: 6rpx solid #fff;
                .active
                    color: #ab2b2b;
                    font-size: 36rpx;
                    border-left: 6rpx solid #ab2b2b;
            .right
                flex:1
                height:1012rpx
                .banner
                    width:100%
                    img 
                        width:100%
                        height:300rpx
                
        .shopcart
            position:fixed
            bottom:0
            left:0
            width:100%
            background:white
            .shopcartitem
                width:100%
                height:150rpx
                padding:0 30rpx
                border-bottom:1px solid #eee
                div
                    display:inline-block
                 .itemimg
                    width:100rpx
                    height:100rpx
                    border-radius:50%
                    overflow:hidden
                    vertical-align:middle
                    img 
                        width:100%
                        height:100%
                .itemcontent
                    line-height:150rpx
                    font-size:28rpx
                    span
                        padding-left:50rpx
                        &:last-child
                            color:red 
                            margin-left:50rpx
                .count
                    margin-left:70rpx
                    div     
                        display:inline-block
                        width:50rpx
                        text-align:center
                        background:#970007
                        border-radius:50%
                        color:white
                    .number 
                        display:inline-block
                        width:50rpx
                        height:50rpx
                        line-height 50rpx
                        text-align center
                        vertical-align middle
                        margin-bottom 10rpx
            .close
                position:absolute
                top:0
                right:0
                width:28rpx
                height 28rpx
                margin:10rpx
                color gray
                


                    
</style>
