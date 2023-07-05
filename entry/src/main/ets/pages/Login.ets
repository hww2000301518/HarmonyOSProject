import Const from '../common/constants/CommonConstants'
import Logger from '../common/utils/Logger'
import router from '@ohos.router'

@Entry
@Component
struct Login {

  @State userName: string = '' //用户名使用手机号
  @State password: string = '' //密码
  @State isSelect: boolean = false //隐私协议是否勾选
  private userNameCheckReg = /^1[3|4|5|6|7|8|9][0-9]{9}/ //手机号校验规则

  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {

      Text(($r('app.string.App_title'))).fontSize(26).fontWeight(Const.FONT_BOLDER)
      Column() {
        //Text(this.userName)
        // if (!this.userNameCheckReg.test(this.userName)) {
        //   Text('用户名必须是11位手机号').fontColor(Color.Red)
        // }
          TextInput({placeholder: $r('app.string.Login_UserName')})
            .type(InputType.PhoneNumber)
            .backgroundColor(Color.White)
            .height($r('app.float.login_input_height'))
            .margin({top: 50})
            .onChange((value)=>{
              this.userName=value;
              console.info(this.userName)
            })

          TextInput({placeholder:$r('app.string.Login_Password')})
            .backgroundColor(Color.White)
            .type(InputType.Password)
            .height($r('app.float.login_input_height'))
            .margin({ top: 50})
            .onChange((value)=>{
              this.password=value;
            })
          }.width(Const.CONTENT_SIZE)

      Column(){

        Button($r('app.string.Login')).width(Const.HALF_SIZE).opacity(0.9).opacity(0.9)
          .height(40)
          .margin(40)
          .onClick(()=>{
            if(!this.isSelect){
              AlertDialog.show({
                title:'提示:',
                message:'请先同意隐私协议！',
                confirm:{
                  value:'关闭',
                  action:()=>{
                    console.info('confirm!!!')
                  }
                }
              })

            }else if (this.userName == '' && this.password == '') {
              Logger.error('login system',`${this.userName} login fail!`)
              AlertDialog.show(
                {
                  title: '提示',
                  message: '输入内容为空，请重新输入',
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
                }
              )
            }
            else if (this.userName == ''&& this.password != '') {
              Logger.error('login system',`${this.userName} login fail!`)
              AlertDialog.show(
                {
                  title: '提示',
                  message: '账号不能为空，请重新输入',
                  autoCancel: true,
                  alignment:DialogAlignment.Center,
                  confirm:{
                    value:'关闭',
                    action:()=>{
                      console.info('confirm')
                    }
                  },
                  cancel: () => {
                    console.info('cancel')
                  }
                }
              )
            }
            else if (this.password == '' && this.userName != '') {
              Logger.error('login system',`${this.userName} login fail!`)
              AlertDialog.show(
                {
                  title: '提示',
                  message: '密码不能为空为空，请重新输入',
                  autoCancel: true,
                  alignment:DialogAlignment.Center,
                  confirm:{
                    value:'关闭',
                    action:()=>{
                      console.info('confirm')
                    }
                  },
                  cancel: () => {
                    console.info('cancel')
                  }
                }
              )
            }
            else if (this.userName != router.getParams()['UN'] || this.password != router.getParams()['PW']) {
              Logger.error('login system',`${this.userName} login fail!`)
              AlertDialog.show(
                {
                  title: '提示',
                  message: '账号或密码错误',
                  autoCancel: true,
                  alignment:DialogAlignment.Center,
                  confirm:{
                    value:'关闭',
                    action:()=>{
                      console.info('confirm')
                    }
                  },
                  cancel: () => {
                    console.info('cancel')
                  }
                }
              )
            }
            else{

              Logger.info('login system',`${this.userName} login ok!`)
              router.pushUrl({
                url:'pages/loading',

              })
            }

          })

       Button('注册').width(Const.HALF_SIZE).opacity(0.9).opacity(0.9)
         .onClick(()=>{
           router.pushUrl({url:'pages/register'})
         })

      }
      Row(){
        Checkbox().select(this.isSelect).backgroundColor('#ffb2b2b3')
          .onChange((value)=>{
            this.isSelect=value
          })

          Text('请先勾选隐私协议').fontColor('#ffffff')
           }
    }
    .width(Const.FULL_WIDTH)
    .height(Const.FULL_HEIGHT)
    .backgroundImage($r("app.media.run4"))
    .backgroundImageSize(ImageSize.Cover)
  }
}
