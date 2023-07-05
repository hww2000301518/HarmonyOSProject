import CommonConstants from '../common/constants/CommonConstants';
import mainViewModel from '../viewmodel/MainViewModel';
import ItemData from '../common/bean/ItemData';
import router from '@ohos.router';

/**
 * Home tab content
 */
@Component
export default struct Home {
  private swiperController: SwiperController = new SwiperController();
  @State changeValue: string = '';
  @State submitValue: string = '';
  controller: SearchController = new SearchController();

  build() {
    Scroll() {
      Column({ space: CommonConstants.COMMON_SPACE }) {
        Column() {
          Search({ value: this.changeValue, placeholder: '请输入搜索内容', controller: this.controller })
            .searchButton('搜索')
            .width('90%')
            .height(40)
            .backgroundColor(Color.White)
            .placeholderColor(Color.Grey)
            .placeholderFont({ size: 14, weight: 400 })
            .textFont({ size: 14, weight: 400 })
            .onSubmit((value: string) => {
              this.submitValue = value;
            })
            .onChange((value: string) => {
              this.changeValue = value;
            })

        }.width('100%')
        Swiper(this.swiperController) {
          ForEach(mainViewModel.getSwiperImages(), (img: Resource) => {
            Image(img).borderRadius($r('app.float.home_swiper_borderRadius'))
          }, img => img.id)
        }
        .onClick(()=>
                router.pushUrl({
                  url:"pages/Videos"
                })
        )
        .height('20%')
        .width('98%')
        .interval(6000)
        //.margin({ top: $r('app.float.home_swiper_margin') })
        .autoPlay(true)

        Grid() {
          ForEach(mainViewModel.getFirstGridData(), (item: ItemData) => {
            GridItem() {
              Column() {
                Image(item.img)
                  .width($r('app.float.home_homeCell_size'))
                  .height($r('app.float.home_homeCell_size'))
                Text(item.title)
                  .fontSize($r('app.float.little_text_size'))
                  .margin({ top: $r('app.float.home_homeCell_margin') })
              }
            }
          }, item => JSON.stringify(item))
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap($r('app.float.home_grid_columnsGap'))
        .rowsGap($r('app.float.home_grid_rowGap'))
        .padding({ top: $r('app.float.home_grid_padding'), bottom: $r('app.float.home_grid_padding') })
        .height($r('app.float.home_grid_height'))
        .backgroundColor(Color.White)
        .borderRadius($r('app.float.home_grid_borderRadius'))

        Row(){
          Text($r('app.string.course'))
            .fontSize($r('app.float.normal_text_size'))
            .fontWeight(FontWeight.Medium)
            .width(CommonConstants.NINETY_PARENT)
            .margin({ top: $r('app.float.home_text_margin') })

          Text($r('app.string.more'))
            .fontSize($r('app.float.little_text_size'))
            .fontColor($r('app.color.home_grid_fontColor'))
            .margin({ top: $r('app.float.home_text_margin') })
            .onClick(() => {
              router.pushUrl({
                url:"pages/more"
              })
            })


          Image($r('app.media.right_grey'))
            .width($r('app.float.setting_jump_width'))
            .height($r('app.float.setting_jump_height'))
            .margin({
              top: $r('app.float.home_text_margin'),
              left:5
            })
            .onClick(() => {
            router.pushUrl({
              url:"pages/more"
            })
          })
        }


        Grid() {
          ForEach(mainViewModel.getSecondGridData(), (secondItem: ItemData) => {
            GridItem() {
            }
            .padding({ top: $r('app.float.home_list_padding'), left: $r('app.float.home_list_padding') })
            .borderRadius($r('app.float.home_backgroundImage_borderRadius'))
            .align(Alignment.TopStart)
            .backgroundImage(secondItem.img)
            .backgroundImageSize(ImageSize.Cover)
            .width(CommonConstants.FULL_PARENT)
            .height(CommonConstants.FULL_PARENT)
          }, secondItem => JSON.stringify(secondItem))
        }
        .onClick(()=>
         router.pushUrl({
           url:"pages/CourseDetail"
         })
        )
        .width(CommonConstants.FULL_PARENT)
        .height($r('app.float.home_secondGrid_height'))
        .columnsTemplate('1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .columnsGap($r('app.float.home_grid_columnsGap'))
        .rowsGap($r('app.float.home_grid_rowGap'))
        .margin({ bottom: $r('app.float.setting_button_bottom')})
      }
    }
    .scrollBar(BarState.Off)
    .height(CommonConstants.FULL_PARENT)
  }
}
function FULL_WIDTH<T>(FULL_WIDTH: any) {
throw new Error('Function not implemented.');
}
