
import Constants from '../../common/constants/CommonConstants';
import MainViewModel from '../../viewmodel/MainViewModel'
import Community from '../../Common/bean/CommunityModel'
import router from '@ohos.router';
import image from '@ohos.multimedia.image';

@Entry
@Component
export default struct English {
  @State currentClassify: number = 0; // selected classify index.
  @State requestSuccess: boolean = false; // is loading data.
  private community: Array<Community> = [];
  private classifyScroller: Scroller = new Scroller();
  private scroller: Scroller = new Scroller();
  controller: SearchController = new SearchController()
  //private swiperController: SwiperController = new SwiperController();
  @State changeValue: string = ''
  @State submitValue: string = ''

  @Builder settingCell(item: Community) {
    Column({ space: 10 }) {
      Row() {
        Row() {
          Image(item.img1)
            .width(50)
            .height(50)
          Column() {
            Text(item.name)
              .fontSize(20)
              .textAlign(TextAlign.Start)
              .width('100%')
            Text(item.date)
              .fontSize(15)
              .textAlign(TextAlign.Start)
              .width('100%')
          }.margin({ left: 15 })
        }
      }.width('100%')

      Row() {
        Image(item.img2)
          .width('100%')
          .height('30%')
          .onClick(()=>{
            router.pushUrl({
              url:'pages/VedioPlay'
            })
          })
      }.width('100%')

      Row() {
        Row() {
          Image(item.isCollect ? $r('app.media.collect_selected') :
          $r('app.media.collect_normal'))
            .width(20)
            .height(20)
            .onClick(() => {
              if (item.isCollect) {
                //!item.isCollect
                item.num1--;
              } else {
                //!item.isCollect
                item.num1++;

              }
              item.isCollect = !item.isCollect;
            })

          Text(item.num1.toString())
        }

        Row() {
          Image($r('app.media.comments'))
            .width(20)
            .height(20)
          Text(item.num2.toString())
        }

        Row() {
          Image(item.isLike ? $r('app.media.like_selected') :
          $r('app.media.like_normal'))
            .width(20)
            .height(20)
            .onClick(() => {
              if (item.isLike) {
                item.num3--;
              } else {
                item.num3++;
              }
              item.isLike = !item.isLike;
            })
          Text(item.num3.toString())
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
      .margin(5)
    }
    .margin(10)
  }
  build() {

    Column() {
      Row() {
        List({ scroller: this.scroller }) {
          ForEach(MainViewModel.getCommunity(), (item: Community) => {
            ListItem() {
              this.settingCell(item)
            }
          }, item => JSON.stringify(item))
        }
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

    }

}
