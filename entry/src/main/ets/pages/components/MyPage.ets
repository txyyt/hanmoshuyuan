@Component
export struct MyPage {
  build() {
    Column() {
      Text('这是我的页面内容')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 });
    }
  }
}
