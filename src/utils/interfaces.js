const domain = 'http://127.0.0.1:3000/';
const interfaces = {
    //获取openId的接口
    getOpenid: domain + 'api/profiles/getOpenid/',
    //轮播接口
    getImages: domain + 'getImages',
    //商品列表接口
    getGoodsList: domain + 'getGoodsList',
    //添加购物车接口
    addCart: domain + 'addCart',
    //查询购物车接口
    getCartList: domain + 'getCartList',
    //同步购物车接口
    updateCart: domain + 'updateCart',
    //分类商品列表
    getFood: domain + 'getFood',
    //新闻列表接口
    getNews: domain + 'getNews'
}

module.exports = interfaces