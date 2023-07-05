import Constants from '../common/constants/CommonConstants';

@Component
export default struct ClassifyItem {
  classifyName: string;
  @Prop isSelected: boolean;
  onClickAction: () => void;

  build() {
    Text(this.classifyName)
      .fontSize($r('app.float.normal_font_size'))
      .fontColor(this.isSelected ? $r('app.color.base_font_color') : $r('app.color.normal_font_color'))
      .fontFamily(this.isSelected ? $r('app.string.hei_ti_medium') : $r('app.string.hei_ti'))
      .fontWeight(this.isSelected ? Constants.TITLE_FONT_WEIGHT : Constants.LABEL_FONT_WEIGHT)
      .textAlign(TextAlign.Center)
      .backgroundColor(this.isSelected ? $r('app.color.base_background') : null)
      .width(Constants.FULL_PERCENT)
      .height($r('app.float.classify_item_height'))
      .onClick(this.onClickAction)
  }
}