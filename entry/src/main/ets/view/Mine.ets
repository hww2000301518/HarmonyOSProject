import CommonConstants from '../common/constants/CommonConstants';
import ItemData from '../common/bean/ItemData';
import mainViewModel from '../viewmodel/MainViewModel';
import router from '@ohos.router';

/**
 * Setting tab content
 */
@Component
export default struct Mine {
  @Builder settingCell(item: ItemData) {
    Row() {
      Row({ space: CommonConstants.COMMON_SPACE }) {
        Image(item.img)
          .width($r('app.float.setting_size'))
          .height($r('app.float.setting_size'))
        Text(item.title)
          .fontSize($r('app.float.normal_text_size'))
      }

      if (item.others === null) {
        Image($r('app.media.right_grey'))
          .width($r('app.float.setting_jump_width'))
          .height($r('app.float.setting_jump_height'))
      } else {
        Toggle({ type: ToggleType.Switch, isOn: false })
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
    Scroll() {
      Column({ space: CommonConstants.COMMON_SPACE }) {
        // Column(){
        //   Text($r('app.string.mainPage_tabTitles_mine'))
        //     .fontWeight(FontWeight.Medium)
        //     .fontSize($r('app.float.page_title_text_size'))
        //     .margin({ top: $r('app.float.mainPage_tabTitles_margin') })
        //     .padding({ left: $r('app.float.mainPage_tabTitles_padding') })
        // }
        // .width(CommonConstants.FULL_PARENT)
        // .alignItems(HorizontalAlign.Start)

        Row() {
          Image($r('app.media.account'))
            .width($r('app.float.setting_account_size'))
            .height($r('app.float.setting_account_size'))
          Column() {
            Text($r('app.string.setting_account_name'))
              .fontSize($r('app.float.setting_account_fontSize'))
            Text($r('app.string.setting_account_email'))
              .fontSize($r('app.float.little_text_size'))
              .margin({ top: $r('app.float.setting_name_margin') })
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: $r('app.float.setting_account_margin') })
        }
        .margin({ top: $r('app.float.setting_account_margin') })
        .alignItems(VerticalAlign.Center)
        .width(CommonConstants.FULL_PARENT)
        .height($r('app.float.setting_account_height'))
        .backgroundColor(Color.White)
        .padding({ left: $r('app.float.setting_account_padding') })
        .borderRadius($r('app.float.setting_account_borderRadius'))


        Row(){
          Column(){
            Image($r('app.media.record'))
              .width('24vp')
              .height('24vp')
              .margin({left:'-8%'})
            Text($r('app.string.history_record'))
              .fontSize('12fp')
              .margin({top:'4vp',left:'-8%'})
          }
          // .onClick(() => {
          //   router.pushUrl({
          //     url:'pages/HistoryPage'
          //   })
          // })
          Column(){
            Image($r('app.media.target'))
              .width('24vp')
              .height('24vp')
              .margin({left:'10%'})
            Text('待办事项')
              .fontSize('12fp')
              .margin({top:'4vp',left:'10%'})
          }.onClick(() => {

            router.pushUrl({
              url:'pages/ToDoListPage'
            })
          })
          Column(){
            Image($r('app.media.circle'))
              .width('24vp')
              .height('24vp')
              .margin({left:'12%'})
            Text('小组')
              .fontSize('12fp')
              .margin({top:'4vp',left:'12%'})
          }
          Column(){
            Image($r('app.media.favorite'))
              .width('24vp')
              .height('24vp')
              .margin({left:'15%'})
            Text('收藏')
              .fontSize('12fp')
              .margin({top:'4vp',left:'15%'})
          }
        }


        List() {
          ForEach(mainViewModel.getSettingListData(), (item: ItemData) => {
            ListItem() {
              this.settingCell(item)
            }
            .height($r('app.float.setting_list_height'))
          }, item => JSON.stringify(item))
        }
        .backgroundColor(Color.White)
        .divider({
          strokeWidth: $r('app.float.setting_list_strokeWidth'),
          color: Color.Grey,
          startMargin: $r('app.float.setting_list_startMargin'),
          endMargin: $r('app.float.setting_list_endMargin')
        })
        .borderRadius($r('app.float.setting_list_borderRadius'))
        .padding({ top: $r('app.float.setting_list_padding'), bottom: $r('app.float.setting_list_padding') })

        Blank()

        Button(('修改密码'), { type: ButtonType.Capsule })
          .width(CommonConstants.BUTTON_WIDTH)
          .height($r('app.float.login_button_height'))
          .fontSize($r('app.float.normal_text_size'))
          .fontColor($r('app.color.setting_button_fontColor'))
          .fontWeight(FontWeight.Medium)
          .backgroundColor($r('app.color.setting_button_backgroundColor'))
          .margin({ bottom: $r('app.float.setting_button_bottom')})
          .onClick(()=>{
            router.pushUrl({url:'pages/change'})
          })

        Button($r('app.string.setting_button'), { type: ButtonType.Capsule })
          .width(CommonConstants.BUTTON_WIDTH)
          .height($r('app.float.login_button_height'))
          .fontSize($r('app.float.normal_text_size'))
          .fontColor($r('app.color.setting_button_fontColor'))
          .fontWeight(FontWeight.Medium)
          .backgroundColor($r('app.color.setting_button_backgroundColor'))
          .margin({ bottom: $r('app.float.setting_button_bottom')})
          // .height(CommonConstants.FULL_PARENT)
          .onClick(()=>{
            router.pushUrl({url: "pages/Login"})
          })
      }
    }
  }
}



