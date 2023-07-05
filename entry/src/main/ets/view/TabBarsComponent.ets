
import GoodsList from '../view/GoodsListComponent'
import SecondList from '../view/SecondGood'
import ThirdList  from '../view/ThirdGood'
import FourthList from '../view/FourthGood'
import FifthList from '../view/FifthGood'
import { initTabBarData } from '../viewmodel/InitialData';
import router from '@ohos.router'
@Component
export default struct TabBar {
  // private currentOffsetY: number = 0;
  // private timer: number = 0;
  @State tabsIndex: number = 0;
  @State refreshStatus: boolean = false;

  @Builder firstTabBar() {
    Column() {

      Text('精选')
        .fontSize(this.tabsIndex === 0 ? 20 : 16)
        .fontColor(this.tabsIndex === 0 ? Color.Black : 0x989a9c)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder otherTabBar(content, index) {
    Column() {
      Text(content)
        .fontSize(this.tabsIndex === index + 1 ? 20 : 16)
        .fontColor(this.tabsIndex === index + 1 ? Color.Black : 0x989a9c)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  // putDownRefresh(event: TouchEvent) {
  //   switch (event.type) {
  //     case TouchType.Down:
  //       this.currentOffsetY = event.touches[0].y;
  //       break;
  //     case TouchType.Move:
  //       this.refreshStatus = event.touches[0].y - this.currentOffsetY > 100;
  //       break;
  //     case TouchType.Cancel:
  //       break;
  //     case TouchType.Up:
  //
  //       // Only simulation effect, no data request
  //       this.timer = setTimeout(() => {
  //         this.refreshStatus = false;
  //       }, 1500);
  //       break;
  //   }
  // }

  // aboutToDisappear() {
  //   clearTimeout(this.timer);
  // }

  build() {
    Tabs() {
      TabContent() {
        Scroll() {
          Column() {
            GoodsList()
            Text('已经到底了').fontSize(16).fontColor(0x989a9c)
          }
          .width('100%')
        }
        .scrollBar(BarState.Off)
        .edgeEffect(EdgeEffect.Spring)
        .width('100%')
        .height('100%')
        // .onTouch((event) => {
        //   this.putDownRefresh(event);
        // })
      }
      .tabBar(this.firstTabBar)

      ForEach(initTabBarData, (item, index) => {
        TabContent() {
          Column() {
             // Text(item).fontSize(20)
            if (this.tabsIndex == 1) {
              SecondList()

              Text('已经到底了').fontSize(16).fontColor(0x989a9c)
            }else if (this.tabsIndex == 2) {
             // SecondList()
             //  Text(item).fontSize(20)
              ThirdList()
            Text('已经到底了').fontSize(16).fontColor(0x989a9c)
          } else if (this.tabsIndex == 3){
              // Text(item).fontSize(20)
              FourthList()
              Text('已经到底了').fontSize(16).fontColor(0x989a9c)
            }else if (this.tabsIndex == 4){
              // Text(item).fontSize(20)
              FifthList()
              Text('已经到底了').fontSize(16).fontColor(0x989a9c)
            }
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .height('100%')
        }
        .tabBar(this.otherTabBar(item, index))
      })
    }
    .onChange((index: number) => {
      this.tabsIndex = index;
    })
    .vertical(false)
  }
}