
@Component
export default struct ToDoItem {
  private content: string;
  @State isComplete: boolean = false;

  @Builder labelIcon(icon) {
    Image(icon)
      .objectFit(ImageFit.Contain)
      .width('28vp')
      .height('28vp')
      .margin('20vp')
  }

  build() {
    Row() {
      if (this.isComplete) {
        this.labelIcon($r('app.media.ic_ok'));
      } else {
        this.labelIcon($r('app.media.ic_default'));
      }

      Text(this.content)
        .fontSize('20fp')
        .fontWeight(500)
        .opacity(this.isComplete ? 0.4 : 1)
        .decoration({ type: this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None })
    }
    .borderRadius(24)
    .backgroundColor($r('app.color.start_window_background'))
    .width('93.3%')
    .height('64vp')
    .onClick(() => {
      this.isComplete = !this.isComplete;
    })
  }
}