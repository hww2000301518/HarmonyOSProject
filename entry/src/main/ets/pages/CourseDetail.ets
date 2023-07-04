

import CommonConstants from '../common/constants/CommonConstants';
import mainViewModel from '../viewmodel/MainViewModel';
import ItemData from '../common/bean/ItemData';
import router from '@ohos.router';

import image from '@ohos.multimedia.image';
import VideoListItem from '../Common/bean/videos';

/**
 * Home tab content
 */
@Entry
@Component
struct CourseDetail {
  controller: SearchController = new SearchController()
  private swiperController: SwiperController = new SwiperController();
  @State CourseName: string = ''
  @State submitValue: string = ''
  private tabsController: TabsController = new TabsController();


  @Builder settingCell(item: ItemData) {
    Row() {
      Row({ space: CommonConstants.COMMON_SPACE }) {
        Image(item.img)
          .width($r('app.float.setting_size'))
          .height($r('app.float.setting_size'))
        Text(item.title)
          .fontSize($r('app.float.normal_text_size'))
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width(CommonConstants.FULL_PARENT)
    .padding({
      left: $r('app.float.setting_settingCell_left'),
      right: $r('app.float.setting_settingCell_right')
    })
  }


  build() {
    Column(){
      Row({space:80}){
        Image($r('app.media.left_grey'))
          .width(40)
          .height(40)
          .onClick(()=>{
            router.back()
          })
        Text('课程详情')
          .textAlign(TextAlign.Center)
          .fontSize($r('app.float.page_title_text_size'))
          .fontWeight(FontWeight.Medium)
      }.width(CommonConstants.FULL_WIDTH)
      .margin(10)

        Row(){
          Image($r('app.media.ic_img_18'))
            .width(CommonConstants.HALF_SIZE)
          Column({space:5}){
            Text('课程名').fontSize(20)
            Text('讲师：')
            Text('学时：')
            Text('课程名')
          }
        }
        .width(CommonConstants.FULL_WIDTH)
        .height($r('app.float.setting_account_height'))

        Row(){
          Tabs({
            barPosition: BarPosition.Start,
            controller: this.tabsController
          }) {
            TabContent(){
              Text('课程介绍').fontSize(30)
            }
            .backgroundColor('#f1f3f5')
            .tabBar('课程介绍')
            TabContent(){
              Scroll(){
                List() {
                  ForEach(mainViewModel.getVideos(), (item: ItemData) => {
                    ListItem() {
                      this.settingCell(item)
                    }
                    .onClick(()=>{
                      router.pushUrl({
                        url:'pages/VedioPlay'
                      })
                    })
                    .height($r('app.float.setting_list_height'))
                  }, item => JSON.stringify(item))
                }
                .height('100%')
                .backgroundColor(Color.White)
                .divider({
                  strokeWidth: $r('app.float.setting_list_strokeWidth'),
                  color: Color.Black,
                  startMargin: $r('app.float.setting_list_startMargin'),
                  endMargin: $r('app.float.setting_list_endMargin')
                })
                .borderRadius($r('app.float.setting_list_borderRadius'))
                .padding({ top: $r('app.float.setting_list_padding'), bottom: $r('app.float.setting_list_padding') })
              }
            }
            .backgroundColor('#f1f3f5')
            .tabBar('课程目录')
            TabContent(){
              Text('课程评价').fontSize(30)
            }
            .backgroundColor('#f1f3f5')
            .tabBar('课程评价')
            TabContent(){
              Text('课程笔记').fontSize(30)
            }
            .backgroundColor('#f1f3f5')
            .tabBar('课程笔记')
          }
          .width('100%')
          .backgroundColor(Color.White)
          .barHeight(60)
          .barMode(BarMode.Fixed)
        }.width(CommonConstants.FULL_WIDTH)



    }.width(CommonConstants.FULL_WIDTH)


  }
}
