import videos from '../common/bean/videos';
import MainViewModel from '../viewmodel/MainViewModel';
@Entry
@Component
export default struct LookVideo {
  @State videoArray:Array<videos> = MainViewModel.getVideos()
  @State index: number = 0; //视频索引
  private videoController:VideoController = new VideoController()
  build() {
    Column(){
      Swiper(){
        Video({
          src:this.videoArray[0].src,
          controller:this.videoController
        })
        Video({
          src:this.videoArray[1].src,
          controller:this.videoController
        })
        Video({
          src:this.videoArray[2].src,
          controller:this.videoController
        })
      }
      .width('100%')
      .height('100%')
      .indicator(false)
      .loop(false)
      .vertical(true)
      .onChange((index:number)=>{
        this.index = index

      })
    }
  }
}