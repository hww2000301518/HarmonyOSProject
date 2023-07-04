import Constants from '../common/constants/CommonConstants';
import ClassifyModel from '../common/bean/ClassifyModel';
import CourseModel from '../common/bean/CourseModel';
import CourseItem from '../view/CourseItem';
import ClassifyItem from '../view/ClassityItem';
import ClassifyViewModel from '../viewmodel/ClassifyViewModel';
import router from '@ohos.router';
@Component
@Entry
struct More{
  @State requestSuccess: boolean = false; // is loading data.
  @State currentClassify: number = 0; // selected classify index.
  private classifyList: Array<ClassifyModel> = [];
  private classifyScroller: Scroller = new Scroller();
  private scroller: Scroller = new Scroller();

  aboutToAppear() {
    // loading data.
    setTimeout(() => {
      this.classifyList = ClassifyViewModel.getLinkData();
      this.requestSuccess = true;
    }, Constants.LOADING_DURATION);
  }

  classifyChangeAction(index: number, isClassify: boolean) {
    if (this.currentClassify !== index) {
      // change the classify status.
      this.currentClassify = index;
      if (isClassify) {
        // scroll the course scroll.
        this.scroller.scrollToIndex(index);
      } else {
        // scroll the classify scroll.
        this.classifyScroller.scrollToIndex(index);
      }
    }
  }

  @Builder ClassifyHeader(classifyName: string) {
    Row() {
      Image($r('app.media.left_grey'))
        .width($r('app.float.setting_jump_width'))
        .height($r('app.float.setting_jump_height'))
        .margin({right:5})
        .onClick(() => {
          router.back()
        })

      Text(classifyName)
        .fontSize($r('app.float.header_font_size'))
        .fontColor($r('app.color.base_font_color'))
        .fontFamily($r('app.string.hei_ti_medium'))
        .fontWeight(Constants.TITLE_FONT_WEIGHT)
    }
    .padding({ left: $r('app.float.item_padding_left') })
    .height($r('app.float.classify_item_height'))
    .width(Constants.FULL_PERCENT)
    .backgroundColor($r('app.color.base_background'))
  }

  build() {

    Column(){
      Row(){
        Image($r('app.media.left_grey'))
          .width(40)
          .height(40)
          .onClick(()=>{
            router.pushUrl({
              url:'pages/homePage'
            })
          })
        Text('热门课程')
          .textAlign(TextAlign.Start)
          .fontSize($r('app.float.page_title_text_size'))
          .fontWeight(FontWeight.Medium)
      }.width(Constants.FULL_WIDTH)
      .margin(10)
      .justifyContent(FlexAlign.Start)

      Column(){
        Row() {
          if (this.requestSuccess) {
            List({ scroller: this.scroller }) {
              ForEach(this.classifyList, (classifyItem: ClassifyModel) => {
                // ListItemGroup({
                //   header: this.ClassifyHeader(classifyItem.classifyName),
                //   space: Constants.COURSE_ITEM_PADDING
                // }) {
                ForEach(classifyItem.courseList, (courseItem: CourseModel) => {
                  ListItem() {
                    CourseItem({ itemStr: JSON.stringify(courseItem) })
                  }
                  .onClick(()=>{
                    router.pushUrl({
                      url:'pages/CourseDetail'
                    })
                  })
                }, (courseItem: CourseModel) => `${courseItem.courseId}`)
                //}
              }, (item: ClassifyModel) => `${item.classifyId}`)
            }

            .padding({ left: $r('app.float.item_padding_left'), right: $r('app.float.course_item_padding') })
            .sticky(StickyStyle.Header)
            .layoutWeight(1)
            .edgeEffect(EdgeEffect.None)
            .onScrollIndex((start: number) => this.classifyChangeAction(start, false))
          } else {
            Text($r('app.string.loading'))
              .fontFamily($r('app.string.hei_ti_medium'))
              .textAlign(TextAlign.Center)
              .height(Constants.FULL_PERCENT)
              .width(Constants.FULL_PERCENT)
          }
        }
        .backgroundColor($r('app.color.base_background'))
      }.width('100%')

    }
  }
}