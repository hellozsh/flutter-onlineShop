const serviceUrl = 'https://mallapi.yunshanmeicai.com';
const baixinUrl = 'https://wxmini.baixingliangfan.cn';


const servicePath = {
  'homePageContext' : serviceUrl + '/api/cms/getmodulesbyroute', // 商家首页信息
  'homePageBelowConten' : serviceUrl + '/api/recommend/feed', // 精选商品
  'categoryPageTopTitle' :  serviceUrl + '/api/commodity/saleclass', // 分类页面菜单

  'getMallGoods': baixinUrl + '/baixing/wxmini/getMallGoods', // 商品
  // 商品列表
};