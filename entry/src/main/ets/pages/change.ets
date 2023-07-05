import Const from '../common/constants/CommonConstants'

import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State userName : string = ''
  @State password: string = ''
  @State password1: string = ''

  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {

      Text('修改密码')
        .fontSize(35)
        .fontWeight(Const.FONT_BOLDER)

      Column(){
      TextInput({ placeholder: '请输入账户名' }).width('90%')
        .backgroundColor(Color.White)
        .onChange((value: string) => {
          this.userName = value
        })

      TextInput({ placeholder: '请输入新密码' }).width('90%')
        .backgroundColor(Color.White)
        .type(InputType.Password)
        .height(40)
        .margin({ top: 50 })
        .onChange((value: string) => {
          this.password = value

        })

      TextInput({ placeholder: '再次输入新密码' }).width('90%')
        .backgroundColor(Color.White)
        .type(InputType.Password)
        .height(40)
        .margin({ top: 50 })
        .onChange((value: string) => {
          this.password1 = value

        })
      }.width(Const.CONTENT_SIZE)

      Button('完成').width('65%')
        .onClick(() => {
          if ((this.password == this.password1) && this.password != '' && this.password1 != '' && this.userName != '') {
            AlertDialog.show({
              title: '提示',
              message: '成功，返回登录界面',
              autoCancel: true,
              alignment: DialogAlignment.Center,
              confirm: {
                value: '确定',
                action: () => {
                  router.pushUrl({
                    url: 'pages/Login',
                    params: {
                      UN: this.userName,
                      PW: this.password
                    }
                  })
                }
              }
            }
            )
          }
          else {
            AlertDialog.show(
              {
                title: '提示',
                message: '失败，账号密码为空或不一致',
                autoCancel: true,
                alignment: DialogAlignment.Center,
                confirm: {
                  value: '关闭',
                  action: () => {
                    console.info('confirm')
                  }
                },
                cancel: () => {
                  console.info('cancel')
                }
              })
          }
        })
    }
    .width(Const.FULL_WIDTH)
    .height(Const.FULL_HEIGHT)
    .backgroundImage($r("app.media.run4"))
    .backgroundImageSize(ImageSize.Cover)
  }

}