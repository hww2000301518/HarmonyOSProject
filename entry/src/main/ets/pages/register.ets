import router from '@system.router'

 @Entry
 @Component
struct register {
   @State message: string = '注册界面'
   @State userName : string = ''
   @State password: string = ''
   @State password1: string = ''
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        TextInput({placeholder: '账号'})
          .placeholderFont({ size: 20, weight: 400 })
          .backgroundColor(Color.White)
          .width(330)
          .height(40)
          .margin(20)
          .fontSize(16)
          .onChange((value)=>{
            this.userName=value;
          })
          //.fontColor('#182431')
          //.backgroundColor('#FFFFFF')

        TextInput({
          placeholder: '密码',
          //controller: this.controller
        })
          .placeholderFont({ size: 20, weight: 400 })
          .backgroundColor(Color.White)
          .type(InputType.Password)
          .width(330)
          .height(40)
          .margin(20)
          .fontSize(16)
          //.fontColor('#182431')
          //.backgroundColor('#FFFFFF')
          .onChange((value)=>{
          this.password=value;
        })

        TextInput({
          placeholder: '确认密码',
          //controller: this.controller
        })
          .placeholderFont({ size: 20, weight: 400 })
          .backgroundColor(Color.White)
          .type(InputType.Password)
          .width(330)
          .height(40)
          .margin(20)
          .fontSize(16)
          //.fontColor('#182431')
          //.backgroundColor('#FFFFFF')
        .onChange((value)=>{
          this.password1=value;
        })

        Button() {
          Text('注册')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor(0xabcdef)
        .width('30%')
        .height('5%')
        .onClick(() => {
          if ((this.password == this.password1) && this.password!='' && this.password1!='' && this.userName!='') {
            AlertDialog.show({
              title: '提示',
              message: '注册成功，返回登录界面',
              autoCancel: true,
              alignment: DialogAlignment.Center,
              confirm: {
                value: '确定',
                action: () => {
                  router.push({uri:'pages/Login',
                    params:{
                      UN:this.userName,
                      PW:this.password
                    }
                  })
                }
              }
            }
          )}
          else{
            AlertDialog.show(
              {
                title: '提示',
                message: '注册失败，账号密码为空或不一致',
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
        .backgroundColor(0x317aff)
      }
      .width('100%')
    }
    .height('100%')
    .backgroundImage($r("app.media.test2"))
    .backgroundImageSize(ImageSize.Cover)
  }
}