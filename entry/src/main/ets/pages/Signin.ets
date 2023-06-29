import router from '@ohos.router';
import CommonConstants from '../../common/constants/CommonConstants';
@Entry
@Component
struct Signin {
  @State message: string = '注册成功'
  build() {
    Flex({direction:FlexDirection.Column,
      justifyContent:FlexAlign.SpaceAround,
      alignItems:ItemAlign.Center}){
      //Column({space:20}){
        // Image($r('app.media.test2'))
        //   .width('100%')
        //   .height('30%')
        //   .border({ width: 1 })
      Column({space:20}) {
        Row() {
          Image($r('app.media.guet'))
            .width(60)
            .height(60)
            .border({ width: 1 })

          Text('用户注册')
            .fontSize(30)
            .fontWeight(700)
            .margin(30)
            .width('45%')
            .fontColor('#002FA7')
        }

        TextInput({ placeholder: '请输入手机号：' })
          .width('80%')
          .type(InputType.PhoneNumber)
        // .margin({ bottom:20 })


        TextInput({ placeholder: '请输入短信验证码：' })
          .width('80%')
          .type(InputType.Number)
          .maxLength(6)

        TextInput({ placeholder: '请输入密码：' })
          .width('80%')
          .type(InputType.Password)

        TextInput({ placeholder: '请确认密码：' })
          .width('80%')
          .type(InputType.Password)
      }

        Button('注册').width('80%')
          .onClick(()=>{
            router.pushUrl({
              url:'pages/Login'
            })
          })
      //}
    }
    .width(CommonConstants.FULL_WIDTH)
    .height(CommonConstants.FULL_HEIGHT)
    .backgroundImage($r('app.media.Siginbackground'))
    .backgroundImageSize(ImageSize.Cover)
  }
}
// Column({space:20}){
//   Image($r('app.media.test2'))
//     .width('100%')
//     .height('30%')
//     .border({ width: 1 })
//   Row(){
//     Image($r('app.media.guet'))
//       .width(60)
//       .height(60)
//       .border({ width: 1 })
//
//     Text('用户注册')
//       .fontSize(30)
//       .fontWeight(700)
//       .margin(10)
//       .width('45%')
//       .fontColor('#002FA7')
//   }
//   TextInput({placeholder:'请输入手机号：'})
//     .width('80%')
//     .type(InputType.PhoneNumber)
//     // .margin({ bottom:20 })
//
//
//   TextInput({placeholder:'请输入短信验证码：'})
//     .width('80%')
//     .type(InputType.Number)
//     .maxLength(6)
//
//   TextInput({placeholder:'请输入密码：'})
//     .width('80%')
//     .type(InputType.Password)
//
//   TextInput({placeholder:'请确认密码：'})
//     .width('80%')
//     .type(InputType.Password)
//
//   Button('注册').width('80%')
//     .onClick(()=>{
//       router.pushUrl({
//         url:'pages/Login'
//       })
//     })
// }