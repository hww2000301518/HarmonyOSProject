//视频信息封装
@Observed export default class videos {
  id: string;
  title:string;//视频标题
  src:Resource; //视频链接
  shareCount: number; //分享次数
  likeCount: number; //点赞数
  isLike:boolean; //是否小红心
  commentCount: number; //评论数

  constructor(id:string,title:string,src:Resource,shareCount:number,likeCount:number,isLike:boolean,commentCount:number) {
  this.id = id;
  this.title = title;
  this.src = src;
  this.shareCount = shareCount;
  this.likeCount = likeCount;
  this.isLike = isLike;
  this.commentCount = commentCount;
}
}