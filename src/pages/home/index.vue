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
                        <img src="/static/ic_menu_shoping_pressed.png" alt="" @click='showType(item.id)'>
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
            <div @click="close" class="close">x</div>
            <div class='shopcartitem' v-for='item in cartList' :key='item.id'>
                <div class='itemimg'>
                    <img :src="item.img_url" alt="">
                </div>
                <div class='itemcontent'>
                    <span class='itemname'>{{item.name}}</span>
                    <span>¥{{item.price*item.count}}</span>
                </div>
                <div class="count">
                    <div @click="reduce(item.pid,item.count)" class="cut">-</div>
                    <input class="number" disabled="" :value='item.count'  />
                    <div @click="add(item.pid)" class="add">+</div>
                </div>
            </div>
            <div class='pay'>
                <span>总计: </span>
                <span class='allprise'>¥{{allPrise}}</span>
                <button>去结算</button>
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
            cateList:['正餐','早餐','寿司','西餐','饮品'],
            nowIndex:0,
            foodList:[],
            pageSize:3,
            show:false,
            cartList:[],
            number:null
        }
    },
    components:{
        foodItem
    },
    computed:{
        allPrise(){
            var prise=0;
            for (let i=0;i<this.cartList.length;i++){
                if(this.cartList[i]){
                    prise=prise+this.cartList[i].price*this.cartList[i].count;
                }
            }
            return prise;
        }
    },
    methods:{
        reduce(id,count){
            count=count-1
            this.$https.request({
            url:this.$interfaces.updateCart+'?id='+id+'&count='+count,
            method:'get'
            }).then(res => {
                console.log(res)
                this.$https.request({
                    url:this.$interfaces.getCartList,
                    method:'get'
                }).then(res => {
                    console.log(res)
                    this.cartList=res.data
                }).catch(error => {
                    console.log(error)
                })
            }).catch(error => {console.log(error)})  
        },
        add(id){
            this.addCart(id)
        },
        close(){
            this.show=false
        },
        showType(id){
            if(!this.show){
                this.show=!this.show
            }
            this.addCart(id)
        },
        addCart(id){
            this.$https.request({
                    url:this.$interfaces.addCart+'?pid='+id,
                    method:'get'
                }).then(res => {
                    console.log(res)
                    this.$https.request({
                        url:this.$interfaces.getCartList,
                        method:'get'
                    }).then(res => {
                        console.log(res)
                        this.cartList=res.data
                    }).catch(error => {
                        console.log(error)
                    })
                }).catch(error => {console.log(error)})
        },
        selectitem(index){
            this.$refs.fooditem.request(index)
            this.nowIndex=index;
        },
        scrolltolower(){
            if(this.pageSize==21){return}
            this.pageSize+=3
            this.$https.request({
                url:this.$interfaces.getGoodsList + '?pageSize='+this.pageSize,
                method:"get"
            }).then(res => {
                // console.log(res)
                // console.log(this.pageSize)
                this.foodList=res.data
            }).catch(error => {
                console.log(error)
            })
        },
    },
    created(){
        this.$https.request({
            url:this.$interfaces.getGoodsList ,
            method:"get"
        }).then(res => {
            // console.log(res)
            this.foodList=res.data
            this.$https.request({
                url:this.$interfaces.getImages,
                method:'get'
            }).then(res => {
                // console.log(res)
                this.imgList=res
            }).catch(error => {
                console.log(error)
            });
        }).catch(error => {
            console.log(error)
        })
        
        
    },
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
                width:100%
                white-space: nowrap;
                .foodItem
                    display:inline-block
                    width:300rpx
                    height:360rpx
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
                        display:inline-block
                        width:150rpx
                        padding-left:50rpx
                        &:last-child
                            width:100rpx
                            color:red 
                            
                            
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
            .pay
                span 
                    display:inline-block
                    font-size 32rpx
                    padding:40rpx
                .allprise
                    padding-left:0
                    color:red
                button 
                    background:#970007
                    color:white
                


                    
</style>
