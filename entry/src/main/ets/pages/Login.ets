import router from '@ohos.router';
import CommonConstants from '../../common/constants/CommonConstants';
import Logger from '../../common/utils/Logger';
@Entry
@Component
struct Login {
  @State message: string = 'Hello World'
  @State phoneNumber : string = ''
  @State password : string = ''
  @State isSelect: boolean = false //隐私协议是否勾选
  private phoneNumberCheckReg = /^1[3|4|5|6|7|8|9][0-9]{9}/ //手机号校验规则
  build() {
    Flex({direction:FlexDirection.Column,
      justifyContent:FlexAlign.SpaceAround,
      alignItems:ItemAlign.Center}){
      Row({space:30}){
        Image($r('app.media.guet'))
          .width(60)
          .height(60)
          .border({ width: 1 })
        Text($r('app.string.App_title'))
          .fontColor('#F0FFFF')
          .fontSize(35)
          .fontWeight(CommonConstants.FONT_BOLDER)
      }
      Column(){
        TextInput({placeholder:$r('app.string.Login_PhoneNumber')})
          .height('40')
          .margin({top:30})
          .backgroundColor('#F0FFFF')
          .onChange((val)=>{
                  this.phoneNumber = val
                })

        TextInput({placeholder:$r('app.string.Login_Password')})
          .type(InputType.Password)
          .height('40')
          .margin({top:30})
          .backgroundColor('#F0FFFF')
          .onChange((val)=>{
                  this.password = val
                })
        Button($r('app.string.Login'))
          .margin(20)
          .width(CommonConstants.HALF_SIZE)
          .opacity(0.9)
          .onClick(()=>{
            console.info('phoneNumber:'+ this.phoneNumber)
            console.info('password:'+ this.password)
            if(!this.isSelect){
              AlertDialog.show({
                title:'提示',
                message:'请先同意隐私协议！',
                confirm:{
                  value:'关闭',
                  action:()=>{
                    console.info('confirm!!!')
                  }
                }
              })
            }
            else if (this.phoneNumber == '' && this.password=='') {
              AlertDialog.show({
                message:'请输入手机号和密码',
                alignment: DialogAlignment.Top
              })
            }
            else if (this.phoneNumber == '') {
              AlertDialog.show({
                message:'请输入手机号',
                alignment: DialogAlignment.Top
              })

            }
            else if (this.password=='') {
              AlertDialog.show({
                message:'请输入密码',
                alignment: DialogAlignment.Top
              })
            }
            else if(this.password=='hww'){
              console.info('login ok!')
              router.pushUrl({
                url:'pages/LoginOK',
                params:{phoneNumberParm:this.phoneNumber}
              })
            }
            else {
              Logger.error('Login:',`${this.phoneNumber}登录失败<<<<<<`)
              AlertDialog.show({
                title:'提示:',
                message:'用户名或密码错误！',
                confirm:{
                  value:'关闭',
                  action:()=>{
                    console.info('confirm!!!')
                  }
                }
              })
            }
          })

        Row({space:80}){
          Text("手机注册")
            .fontSize(15)
            .fontColor('#FF4500')
            .onClick(()=>{
              router.pushUrl({
                url:'pages/Signin'
              })
            })

          Text("忘记密码")
            .fontSize(15)
            .fontColor('#FF4500')
        }

        Row({space:60}){
          Image($r('app.media.QQ'))
            .width(30)
            .height(30)


          Divider()
            .vertical(true)
            .height(20)
            .color('#FF4500')

          Image($r('app.media.WeChat'))
            .width(30)
            .height(30)
        }.margin(10)

        }.width(CommonConstants.CONTENT_SIZE)


        Row(){
          Checkbox().select(false)
            .backgroundColor(Color.Gray)
            .onChange((value)=>{
              this.isSelect = value;
            })
          Text($r('app.string.Login_check_License'))
            .fontColor(Color.Black)

        }
      }
      .width(CommonConstants.FULL_WIDTH)
      .height(CommonConstants.FULL_HEIGHT)
      .backgroundImage($r('app.media.background'))
      .backgroundImageSize(ImageSize.Cover)
  }
}
// Column({space:20}) {
//     Image($r('app.media.test'))
//     .width('100%')
//     .height('30%')
//     .border({ width: 1 })
//     Row(){
//       Image($r('app.media.guet'))
//         .width(60)
//         .height(60)
//         .border({ width: 1 })
//
//       Text('通鸿云课堂')
//         .fontSize(30)
//         .fontWeight(700)
//         .margin(10)
//         .width('45%')
//         .fontColor('#002FA7')
//     }
//
//   TextInput({placeholder:'请输入手机号：'})
//     .width('80%')
//     // .margin({ bottom:20 })
//     .onChange((val)=>{
//       this.phoneNumber = val
//     })
//
//   TextInput({placeholder:'请输入密码：'})
//     .width('80%')
//     .type(InputType.Password)
//     .onChange((val)=>{
//       this.password = val
//     })
//
//   Button('登录').width('80%')
//     .onClick(()=>{
//       console.info('abc:'+ this.phoneNumber)
//       if (this.phoneNumber == '' && this.password=='') {
//         AlertDialog.show({
//           message:'请输入手机号和密码',
//           alignment: DialogAlignment.Top
//         })
//       }
//       else if (this.phoneNumber == '') {
//         AlertDialog.show({
//           message:'请输入手机号',
//           alignment: DialogAlignment.Top
//         })
//
//       }
//       else if (this.password=='') {
//         AlertDialog.show({
//           message:'请输入密码',
//           alignment: DialogAlignment.Top
//         })
//       }
//       else {
//         router.pushUrl({
//           url:'pages/LoginOK',
//           params:{phoneNumberParm:this.phoneNumber}
//         })
//       }
//     })
//
//   Row({space:80}){
//     Text("手机注册")
//       .fontSize(15)
//       .fontColor('#FF4500')
//       .onClick(()=>{
//         router.pushUrl({
//           url:'pages/Signin'
//         })
//       })
//
//     Text("忘记密码")
//       .fontSize(15)
//       .fontColor('#FF4500')
//   }
//
//   Row({space:60}){
//     Image($r('app.media.QQ'))
//       .width(30)
//       .height(30)
//
//
//     Divider()
//       .vertical(true)
//       .height(20)
//       .color('#FF4500')
//
//     Image($r('app.media.WeChat'))
//       .width(30)
//       .height(30)
//   }.margin(30)
//
// }.width('100%')