

import DataModel from '../viewmodel/ListDataModel';
import ToDoItem from '../view/ToDoItem';
import router from '@ohos.router';

@Entry
@Component
struct ToDoListPage {
  private totalTasks: Array<string> = [];

  aboutToAppear() {
    this.totalTasks = DataModel.getData();
  }

  build() {
    Column({ space: 16 }) {
      Row(){

        Image($r('app.media.left_grey'))
          .width('10%')
          .margin({
            top:'24vp',
            bottom:'12vp'
          })
          .onClick(() => {
            router.back()
          })
      Text('待办')
        .fontSize('28fp')
        .fontWeight(FontWeight.Bold)
        .lineHeight('33vp')
        .width('80%')
        .margin({
          top: '24vp',
          bottom: '12vp'
        })
        .textAlign(TextAlign.Start)
      }

      ForEach(this.totalTasks, (item) => {
        ToDoItem({ content: item })
      }, item => JSON.stringify(item))

      Button()
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xf1f3f5)

  }
}