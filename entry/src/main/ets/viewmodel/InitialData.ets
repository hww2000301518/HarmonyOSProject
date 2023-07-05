
export const initTabBarData = [

  '英语',
  '考研',
  '考证',
  'IT'
]

export interface GoodsListItemType {
  goodsImg: Resource;
  goodsName: string ;
  advertising_language: string;
  evaluate:string;
  price: string;
}

export const goodsInitialList: GoodsListItemType[] = [
  {
    goodsImg: $r('app.media.KaoYan05'),
    goodsName: '考研',
    advertising_language: '重磅推荐',
    evaluate: '95%好评',
    price: '免费'
  },
  {
    goodsImg: $r('app.media.KaoYan01'),
    goodsName: '考研',
    advertising_language: '十分有用',
    evaluate: '94%',
    price: '￥888'
  },
  {
    goodsImg: $r('app.media.KaoYan02'),
    goodsName: '考研',
    advertising_language: '精品推荐',
    evaluate: '98%',
    price: '￥1888'
  },
  {
    goodsImg: $r('app.media.IT04'),
    goodsName: 'IT',
    advertising_language: '趁现在狠狠赚一笔',
    evaluate: '100%',
    price: '￥6666'
  },
]


export const SecondgoodsInitialList: GoodsListItemType[] = [
  {
    goodsImg: $r('app.media.English01'),
    goodsName: '学英语',
    advertising_language: '重磅推荐',
    evaluate: '95%好评',
    price: '￥999'
  },
  {
    goodsImg: $r('app.media.English02'),
    goodsName: '学英语',
    advertising_language: '好评如潮',
    evaluate: '95%',
    price: '￥888'
  },
  {
    goodsImg: $r('app.media.English03'),
    goodsName: '英语',
    advertising_language: '新课',
    evaluate: '93%',
    price: '￥777'
  },
  {
    goodsImg: $r('app.media.English04'),
    goodsName: '新东放英语',
    advertising_language: '好课',
    evaluate: '92%',
    price: '￥666'
  },
]


export const ThirdgoodsInitialList: GoodsListItemType[] = [
  {
    goodsImg: $r('app.media.KaoYan01'),
    goodsName: '考研',
    advertising_language: '重磅推荐',
    evaluate: '95%好评',
    price: '￥999'
  },
  {
    goodsImg: $r('app.media.KaoYan02'),
    goodsName: '考研',
    advertising_language: '新课试看',
    evaluate: '94%',
    price: '￥888'
  },
  {
    goodsImg: $r('app.media.KaoYan03'),
    goodsName: '考研',
    advertising_language: '精品',
    evaluate: '93%',
    price: '￥777'
  },
  {
    goodsImg: $r('app.media.KaoYan04'),
    goodsName: '考研',
    advertising_language: 'nice',
    evaluate: '92%',
    price: '￥666'
  },
]


export const FourthgoodsInitialList: GoodsListItemType[] = [
  {
    goodsImg: $r('app.media.KaoGong01'),
    goodsName: '考证',
    advertising_language: '重磅推荐',
    evaluate: '95%好评',
    price: '￥999'
  },
  {
    goodsImg: $r('app.media.KaoGong02'),
    goodsName: '考证',
    advertising_language: '容易学',
    evaluate: '94%',
    price: '￥888'
  },
  {
    goodsImg: $r('app.media.KaoGong03'),
    goodsName: '考证',
    advertising_language: '精品',
    evaluate: '93%',
    price: '￥777'
  },
  {
    goodsImg: $r('app.media.KaoGong04'),
    goodsName: '考证',
    advertising_language: '免费精品课',
    evaluate: '92%',
    price: '免费'
  },
]



export const FifthgoodsInitialList: GoodsListItemType[] = [
  {
    goodsImg: $r('app.media.IT01'),
    goodsName: 'IT',
    advertising_language: '重磅推荐',
    evaluate: '95%好评',
    price: '￥9999'
  },
  {
    goodsImg: $r('app.media.IT02'),
    goodsName: 'IT',
    advertising_language: '非常有用',
    evaluate: '94%',
    price: '￥888'
  },
  {
    goodsImg: $r('app.media.IT03'),
    goodsName: 'IT',
    advertising_language: '当前热门',
    evaluate: '93%',
    price: '￥777'
  },
  {
    goodsImg: $r('app.media.IT04'),
    goodsName: 'IT',
    advertising_language: '赶紧来学',
    evaluate: '92%',
    price: '￥666'
  },
]