<template>
    <div class='itemContainer'>
         <scroll-view 
                :scroll-y='true' 
                :scroll-into-view='toView'
                @scrolltolower='scrolltolower'
                @scrolltoupper='scrolltoupper'
                >
            <div class='cateTitle'>
                <span class='cateInco'>{{catetitle}}</span>
                <span>大家都喜欢,才是真好吃</span>
            </div>
            <div class='fooditem' v-for='(item,index) in foodList' :key=item.id
            :id="'fl-'+index">
                <div class='itemimg'>
                    <img :src=item.img_url alt="">
                </div>
                <div class='itemcontent'>
                    <p class='name'>{{item.name}}</p>
                    <p class='tips'>{{item.content}}</p>
                    <p class='sales'>月售{{item.sale}} 好评率99% </p>
                    <div class='price_add_box'>
                        <span>¥{{item.price}}</span>
                        <img src="/static/ic_menu_shoping_pressed.png" alt="" @click='clickhandle(item.pid)'>
                    </div>
                </div>
            </div>
            <div class='fooditem' v-for='(item,index) in foodList' :key=item.id
            :id="'fl-'+index">
                <div class='itemimg'>
                    <img :src=item.img_url alt="">
                </div>
                <div class='itemcontent'>
                    <p class='name'>{{item.name}}</p>
                    <p class='tips'>{{item.content}}</p>
                    <p class='sales'>月售{{item.sale}} 好评率99% </p>
                    <div class='price_add_box'>
                        <span>¥{{item.price}}</span>
                        <img src="/static/ic_menu_shoping_pressed.png" alt="" @click='clickhandle(item.pid)'>
                    </div>
                </div>
            </div>
        </scroll-view>
    </div>
</template>

<script>
export default {
    data(){
        return{
            foodList:[],
            toView:null,
            pageSize:null,
        }
    },
    methods:{
        // 上划至顶及下滑至底时触发加载
        // scrolltoupper(){
        //     if(this.nowindex!=0&&this.nowindex<5){
        //         this.nowindex-=1
        //     }else{
        //         this.nowindex=0
        //     }
        //     this.request(this.nowindex)
        //     this.toView='fl-'+(this.foodList.length-1)
        //     console.log(this.toView)
        //     console.log(this.foodList)
        // },
        // scrolltolower(){
        //     if(this.nowindex<5){
        //         this.nowindex+=1
        //     }else{
        //         this.nowindex=0
        //     }
        //     this.request(this.nowindex)
        //     this.toView='fl-0'
        //     console.log(this.toView)
        // },
        clickhandle(pid){
            this.$emit('clickHandle',pid)
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
    props:['catetitle','nowindex'],
    created(){
        this.request()
    }
    
}
</script>

<style lang="stylus" scoped>
    .itemContainer
        width:100%
        border:1px solid #eee
        scroll-view
            height 712rpx
            overflow hidden
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
