import router from '@ohos.router';
@Entry
@Component
struct Index {

  @State message:string ='欢迎登录'
  build(){
  Row() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button() {
        Text('登录')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }.type(ButtonType.Capsule)
      .margin({
        top: 20
      }).onClick(() => {
        router.pushUrl({url:'pages/LoginOK'})
      })
      .backgroundColor(0xabcdef)
      .width('30%')
      .height('5%')
    }
    .width('100%')
  }
  .height('100%') }}