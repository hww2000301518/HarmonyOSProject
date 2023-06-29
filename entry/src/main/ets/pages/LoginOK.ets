import router from '@ohos.router';
@Entry
@Component
struct LoginOK {
  @State message: string = '登录成功'
  build() {
  Row() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button() {
        Text('返回')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .type(ButtonType.Capsule)
      .margin({
        top: 20
      }).onClick(() => {
        router.back()
      })
      .backgroundColor(0xabcdef)
      .width('30%')
      .height('5%')
    }
    .width('100%')
  }
  .height('100%')
}
}