<template>
    <div class='itemContainer'>
        <div class='cateTitle'>
            <span class='cateInco'>{{catetitle}}</span>
            <span>大家都喜欢,才是真好吃</span>
        </div>
        <div class='fooditem' v-for='item in foodList' :key=item.id>
            <div class='itemimg'>
                <img :src=item.img_url alt="">
            </div>
            <div class='itemcontent'>
                <p class='name'>{{item.name}}</p>
                <p class='tips'>{{item.content}}</p>
                <p class='sales'>月售{{item.sale}} 好评率99% </p>
                <div class='price_add_box'>
                    <span>¥{{item.price}}</span>
                    <img src="/static/ic_menu_shoping_pressed.png" alt="" @click='clickhandle'>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            foodList:[],
            pageSize:null,
        }
    },
    methods:{
        clickhandle(){
            this.$emit('clickHandle')
        },
        request(index){
            this.$https.request({
                url:this.$interfaces.getFood+ '?fid='+(index+1),
                method:"get"
            }).then(res => {
                // console.log(res)
                this.foodList=res.data
            }).catch(error => {
                console.log(error)
            })
        }
    },
    props:['catetitle'],
    created(){
        this.request()
    }
    
}
</script>

<style lang="stylus" scoped>
    .itemContainer
        width:100%
        border:1px solid #eee
        .cateTitle
            font-size:24rpx
            color:#999
            .cateInco
                color:black
                font-size:26rpx
                padding-right:10rpx
                font-weight:bold
        .fooditem
            width:100%
            display:flex
            height:200rpx
            padding: 10rpx 
            
            .itemimg
                width:200rpx
                height:100%
                margin-right:10rpx
                img
                    width:200rpx
                    height:100%
            .itemcontent
                flex:1
                .name 
                    font-size:24rpx
                    margin-bottom:20rpx
                .sales,.tips
                    color:gray
                    font-size:20rpx
                    margin-bottom:10rpx
                    margin-right:10rpx
                    max-width:300rpx
                    overflow hidden
                    white-space:nowrap
                    text-overflow: ellipsis
                .price_add_box
                    line-height:30rpx
                    margin-top:40rpx
                    span 
                        color:red
                        font-size:24rpx
                        font-weight:bold
                    img
                        width:30rpx
                        height:30rpx
                        float:right
                        margin-right:30rpx
</style>
