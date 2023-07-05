import Constants from '../common/constants/CommonConstants';
import CourseModel from '../common/bean/CourseModel';

@Component
export default struct CourseItem {
  @Prop itemStr: string;
  item: CourseModel;

  aboutToAppear() {
    this.item = JSON.parse(this.itemStr);
  }

  build() {
    Row() {
      Image(this.item.imageUrl)
        .height(Constants.FULL_PERCENT)
        .aspectRatio(1)
      Column() {
        Text(this.item.courseName)
          .fontSize($r('app.float.normal_font_size'))
          .fontColor($r('app.color.base_font_color'))
          .fontFamily($r('app.string.hei_ti_medium'))
          .maxLines(Constants.TITLE_LINE_NUMBER)
          .textOverflow({ overflow: TextOverflow.Clip })
          .lineHeight($r('app.float.title_line_height'))
          .width(Constants.FULL_PERCENT)
        Text(this.item.price === 0 ? $r('app.string.free_price') : $r('app.string.price_str', this.item.price))
          .fontSize($r('app.float.header_font_size'))
          .fontColor($r('app.color.price_color'))
          .fontFamily($r('app.string.hei_ti_medium'))
      }
      .padding($r('app.float.course_item_padding'))
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.SpaceBetween)
      .height(Constants.FULL_PERCENT)
    }
    .clip(true)
    .borderRadius($r('app.float.normal_border_radius'))
    .backgroundColor($r('app.color.start_window_background'))
    .width('100%')
    .height($r('app.float.course_item_height'))
  }
}