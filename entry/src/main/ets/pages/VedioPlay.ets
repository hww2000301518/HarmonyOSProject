import CommonConstants from '../common/constants/CommonConstants';
import router from '@ohos.router';

@Entry
@Component
struct VideoPlay{
  @State videoSrc: Resource = $rawfile('video1.mp4')
  @State previewUri: Resource = $r('app.media.target')
  @State curRate: PlaybackSpeed = PlaybackSpeed.Speed_Forward_1_00_X
  @State isAutoPlay: boolean = false
  @State showControls: boolean = true
  controller: VideoController = new VideoController()

    build() {

      Column() {
        Row({ space: 80 }) {
          Image($r('app.media.left_grey'))
            .width(40)
            .height(40)
            .onClick(()=>{
              // router.pushUrl({
              //   url:'pages/CourseDetail'
              // })
              router.back()
            })
          Text('视频播放页')
            .textAlign(TextAlign.Center)
            .fontSize($r('app.float.page_title_text_size'))
            .fontWeight(FontWeight.Medium)
        }.width(CommonConstants.FULL_WIDTH)
        .margin(10)


        // Swiper(this.swiperController){
        //   ForEach(mainViewModel.getSwiperImages(),(img:Resource)=> {
        //     Image(img).borderRadius($r('app.float.home_swiper_borderRadius'))
        //   },img => img.id)
        // }
        // .autoPlay(true)

        Column(){

          Video({
            src: this.videoSrc,
            //previewUri: this.previewUri,
            currentProgressRate: this.curRate,
            controller: this.controller
          }).width('100%').height('30%')
            .autoPlay(this.isAutoPlay)
            .controls(this.showControls)
            .onStart(() => {
              console.info('onStart')
            })
            .onPause(() => {
              console.info('onPause')
            })
            .onFinish(() => {
              console.info('onFinish')
            })
            .onError(() => {
              console.info('onError')
            })
            .onPrepared((e) => {
              console.info('onPrepared is ' + e.duration)
            })
            .onSeeking((e) => {
              console.info('onSeeking is ' + e.time)
            })
            .onSeeked((e) => {
              console.info('onSeeked is ' + e.time)
            })
            .onUpdate((e) => {
              console.info('onUpdate is ' + e.time)
            })
        }

      }
    }
}