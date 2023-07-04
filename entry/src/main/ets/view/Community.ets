

import Constants from '../common/constants/CommonConstants';
import router from '@ohos.router';
import English from './community/English';

/**
 * Setting tab content
 */
@Entry
@Component
export default struct Community {
  private tabsController: TabsController = new TabsController();

  build(){
    Column(){
      Row(){
        Image($r('app.media.community_messages'))
          .width(30)
          .height(30)
          .onClick(()=>{
            router.pushUrl({
              url:'pages/MainPage'

            })
          })
        Text('发现')
          .textAlign(TextAlign.Start)
          .fontSize($r('app.float.page_title_text_size'))
          .fontWeight(FontWeight.Medium)

        Image($r('app.media.business_cards'))
          .width(30)
          .height(30)
          .onClick(()=>{
            router.pushUrl({
              url:'pages/MainPage'

            })
          })
      }.width(Constants.FULL_WIDTH)
      .margin({top:15})
      .justifyContent(FlexAlign.SpaceBetween)

      Tabs({
        barPosition: BarPosition.Start,
        controller: this.tabsController
      }){
        TabContent(){
          English()
        }
        .backgroundColor('#f1f3f5')

        .tabBar('英语')

        TabContent(){
          Text('职场').fontSize(30)
        }
        .backgroundColor('#f1f3f5')
        .tabBar('职场')

        TabContent(){
          Text('建工').fontSize(30)
        }
        .backgroundColor('#f1f3f5')
        .tabBar('建工')

        TabContent(){
          Text('记忆').fontSize(30)
        }
        .backgroundColor('#f1f3f5')
        .tabBar('记忆')

        TabContent(){
          Text('插画').fontSize(30)
        }
        .backgroundColor('#f1f3f5')
        .tabBar('插画')
      }
    }


  }
}



