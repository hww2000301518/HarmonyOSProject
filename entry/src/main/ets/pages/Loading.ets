import Const from '../common/constants/CommonConstants'
import router from '@ohos.router';
@Entry
@Component
struct Loading {

  @State progValue:number = 50
  @State progColorValue:number = 50
  @State phoneNumberParm:string = router.getParams()['phoneNumberParm']

  private timer:number

  build() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {

      Text(`[${this.phoneNumberParm}]正在登录...`).fontSize(20).fontColor('#ffa73333')
      Progress({ value: this.progValue, total: 150, type: ProgressType.ScaleRing })
        .color(Color.Grey).value(this.progColorValue).width(150)
        .style({ strokeWidth: 20, scaleCount: 30, scaleWidth: 5 })


    }.width(Const.FULL_WIDTH)
    .height(Const.FULL_HEIGHT)
  }

  aboutToAppear(){
    if(this.progValue <=150 && this.progColorValue <=150){
      this.timer = setInterval(()=>{
        this.progValue += 50;
        this.progColorValue += 50;

      },1000)
    }
    setTimeout(()=>{
      clearInterval(this.timer)
      router.pushUrl({
        url:'pages/homePage',
        params:{
          phoneNumberParm:this.phoneNumberParm
        }
      })
    },3000)
  }

}
