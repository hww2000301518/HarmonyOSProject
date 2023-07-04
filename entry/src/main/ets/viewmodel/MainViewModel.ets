
import CommunityModel from '../Common/bean/CommunityModel';

import ItemData from '../common/bean/ItemData';
import videos from '../common/bean/videos';
import Community from '../view/Community';

/**
 * Binds data to components and provides interfaces.
 */
export class MainViewModel {

  /**
   * Get swiper image data.
   *
   * @return {Array<Resource>} swiperImages.
   */
  getSwiperImages(): Array<Resource> {
    let swiperImages: Resource[] = [
      $r('app.media.img1'),
      $r('app.media.img2'),
      $r('app.media.img3'),
      $r('app.media.img4'),
      $r('app.media.img5')
    ];
    return swiperImages;
  }

  /**
   * Get data of the first grid.
   *
   * @return {Array<PageResource>} firstGridData.
   */
  getFirstGridData(): Array<ItemData> {
    let firstGridData: ItemData[] = [
      new ItemData($r('app.string.my_love'), $r('app.media.love')),
      new ItemData($r('app.string.free_course'), $r('app.media.record')),
      new ItemData($r('app.string.message'), $r('app.media.message')),
      new ItemData($r('app.string.shopping_car'), $r('app.media.shopping')),
      new ItemData($r('app.string.peixun'), $r('app.media.target')),
      new ItemData($r('app.string.class'), $r('app.media.circle')),
      new ItemData($r('app.string.favorite'), $r('app.media.favorite')),
      new ItemData($r('app.string.clear'), $r('app.media.recycle'))
    ];
    return firstGridData;
  }


  /**
   * Get data of the second grid.
   *
   * @return {Array<PageResource>} secondGridData.
   */
  getSecondGridData(): Array<ItemData> {
    let secondGridData: ItemData[] = [
      new ItemData($r('app.string.my_love'), $r('app.media.course1'), $r('app.string.my_love')),
      new ItemData($r('app.string.my_love'), $r('app.media.course2'), $r('app.string.my_love')),
      new ItemData($r('app.string.my_love'), $r('app.media.course3'), $r('app.string.my_love')),
      new ItemData($r('app.string.my_love'), $r('app.media.course4'), $r('app.string.my_love'))
    ];
    return secondGridData;
  }


  /**
   * Get data of the setting list.
   *
   * @return {Array<PageResource>} settingListData.
   */
  getSettingListData(): Array<ItemData> {
    let settingListData: ItemData[] = [
      new ItemData($r('app.string.setting_list_news'), $r("app.media.news"), $r("app.string.setting_toggle")),
      new ItemData($r('app.string.setting_list_data'), $r("app.media.data"), null),
      new ItemData($r('app.string.setting_list_menu'), $r("app.media.menu"), null),
      new ItemData($r('app.string.setting_list_about'), $r("app.media.about"), null),
      new ItemData($r('app.string.setting_list_storage'), $r("app.media.storage"), null),
      new ItemData($r('app.string.setting_list_privacy'), $r("app.media.privacy"), null)
    ];
    return settingListData;
  }

  getVideos():Array<videos>{
    let videosDetail:Array<videos> =[
      new videos('1','踏浪而来',$rawfile('video1.mp4'),111,1231,true,123),
      new videos('2','椰风起时',$rawfile('video2.mp4'),122,1241,false,234),
      new videos('3','夜航船',$rawfile('video3.mp4'),133,234,true,345),
      new videos('4','艳阳高照',$rawfile('video4.mp4'),144,3456,false,456),
    ]
    return videosDetail;
  }

  getCommunity():Array<CommunityModel>{
    let getCommunity:Array<CommunityModel> =[
      new CommunityModel(false,false,$r('app.media.round1'),'杨亮老师','2022年9月28日',$r('app.media.test'),100,1000,100),
      new CommunityModel(false,false,$r('app.media.round2'),'杨亮老师','2022年9月28日',$r('app.media.test'),100,1000,100),
      new CommunityModel(false,false,$r('app.media.round3'),'杨亮老师','2022年9月28日',$r('app.media.test'),100,1000,100),
      new CommunityModel(false,false,$r('app.media.round4'),'杨亮老师','2022年9月28日',$r('app.media.test'),100,1000,100),
      new CommunityModel(false,false,$r('app.media.round5'),'杨亮老师','2022年9月28日',$r('app.media.test'),100,1000,100),
      new CommunityModel(false,false,$r('app.media.round6'),'杨亮老师','2022年9月28日',$r('app.media.test'),100,1000,100),
    ]
    return getCommunity;
  }
}

export default new MainViewModel();