@Component
export struct MapPage {
  build() {
    Column() {
      Text('这是地图页面内容')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 });
    }
  }
}
