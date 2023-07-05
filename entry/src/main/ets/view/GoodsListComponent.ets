
import { ListDataSource } from '../viewmodel/ListDataSource';
<<<<<<< HEAD
import router from '@ohos.router';
=======
>>>>>>> origin/main
@Component
export default struct GoodsList {
  @Provide goodsListData: ListDataSource = new ListDataSource();
  private startTouchOffsetY: number = 0;
  private endTouchOffsetY: number = 0;

  build() {
    Row() {
      List({ space: 16 }) {
        LazyForEach(this.goodsListData, (item) => {
          ListItem() {
            Row() {
              Column() {
                Image(item?.goodsImg)
                  .width('100%')
                  .height('100%')
              }
              .width('40%')
              .height('100%')

              Column() {
                Text(item?.goodsName)
                  .fontSize(16)
                  .margin({ bottom: 20 })

                Text(item?.advertising_language)
                  .fontColor(Color.Black)
                  .fontSize(12)
                  .margin({ right: 32, bottom: 20})

                Row() {
                  Text(item?.evaluate).fontSize(12).fontColor(0x182431)
                  Text(item?.price).fontSize(16).fontColor(0xe92f4f)
                }
                .justifyContent(FlexAlign.SpaceAround)
                .width('94%')
              }
              .padding(8)
              .width('60%')
              .height('100%')
            }
            .justifyContent(FlexAlign.SpaceBetween)
            .height('20%')
            .width('100%')
          }
<<<<<<< HEAD
          .onClick(()=>{
            router.pushUrl({url:'pages/CourseDetail'})
          })
=======
>>>>>>> origin/main
          .onTouch((event: TouchEvent) => {
            switch (event.type) {
              case TouchType.Down:
                this.startTouchOffsetY = event.touches[0].y;
                break;
              case TouchType.Up:
                this.startTouchOffsetY = event.touches[0].y;
                break;
              case TouchType.Move:
                if(this.startTouchOffsetY - this.endTouchOffsetY > 0) {
                  this.goodsListData.pushData();
                }
                break;
            }
          })
        })
      }
      .width('94%')
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
  }
}