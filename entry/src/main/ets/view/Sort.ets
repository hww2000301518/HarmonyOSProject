import Const from "../common/constants/CommonConstants"
import TabBar from './TabBarsComponent'
@Entry
@Component
export default struct Sort {
  build() {
    // Column({ space: 5 }) {
    Column({ space: Const.COMMON_SPACE }) {
      Row() {
        TextInput({ placeholder: '搜索...' })
          .width('80%')
          .height(40)
          .backgroundColor('#FFFFFF')
          .margin({ top: '6%', right: 8, left: '4%', bottom: 5 })
          .backgroundColor(0xe6e6fa)
        Image($r("app.media.ic_public_add_norm"))
          .width(30)
          .height(30)
          .margin({ left: 7, right: 7, top: '6%' })
      }.width('100%')

      Row() {
        // Navigation() {
        Column() {
          TabBar()
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
        // }
        // .size({ width: '100%', height: '100%' })
        // .title('课程')
        // .titleMode(NavigationTitleMode.Mini)
      }
      .margin({ top: '3%' })
      .height('100%')
      .backgroundColor(Color.White)
      //       Column() {
      //         Tabs({ barPosition: BarPosition.Start})
      //         {
      //           TabContent() {
      //             Column().width('100%').height('100%').backgroundColor(Color.Pink)
      //           }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'pink'))
      //           .margin({left:10})
      //
      //           TabContent() {
      //             Column().width('100%').height('100%').backgroundColor(Color.Yellow)
      //           }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'Yellow')).margin({top:20})
      //
      //           TabContent() {
      //             Column().width('100%').height('100%').backgroundColor(Color.Blue)
      //           }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'Blue'))
      //
      //           TabContent() {
      //             Column().width('100%').height('100%').backgroundColor(Color.Green)
      //           }.tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), 'Green'))
      //         }
      //         .vertical(true).scrollable(true).barMode(BarMode.Fixed)
      //         .onChange((index: number) => {
      //           console.info(index.toString())
      //         })
      //         .width('100%')
      //         .backgroundColor(0xF1F3F5)
      //       }.width('100%').height('100%')
      //     }
    }
  }
}