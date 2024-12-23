import { HomePage } from './components/HomePage';
import { MapPage } from './components/MapPage';
import { MyPage } from './components/MyPage';

@Entry
@Component
export struct Index {
  @State currentIndex: number = 0;
  private controller: TabsController = new TabsController();

  build() {
    Column() {
      // 标签内容区域
      Tabs({
        barPosition: BarPosition.End,
        controller: this.controller,
        index: this.currentIndex
      }) {
        // 首页内容
        TabContent() {
          HomePage(); // 使用自定义组件
        }.tabBar({ text: '首页' });

        // 地图内容
        TabContent() {
          MapPage(); // 使用自定义组件
        }.tabBar({ text: '地图' });

        // 我的内容
        TabContent() {
          MyPage(); // 使用自定义组件
        }.tabBar({ text: '我的' });
      }
      .barHeight(50) // 设置底部 TabBar 高度
      .animationDuration(300); // Tab 切换动画持续时间
    }
    .width('100%')
    .justifyContent(FlexAlign.Start)
  }
}
