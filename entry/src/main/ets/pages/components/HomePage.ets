import { SearchInput } from './SearchInput';
import { Constants } from '../common/Constants';

@Component
export struct HomePage {
  @State searchValue: string = '';

  build() {
    Column() {
      // 搜索栏
      SearchInput({
        enableKeyboardOnFocus: true,
        placeholderArray: ['搜索'],
        searchValue: this.searchValue,
        onSearch: (value: string) => {
          // 处理搜索逻辑
          console.log('搜索内容:', value);
        },
        onChange: (value: string) => {
          this.searchValue = value;
        }
      })
        .margin({ top: 0, bottom: Constants.MD_SPACE, left: Constants.SM_SPACE, right: Constants.SM_SPACE })
        .padding(Constants.SM_SPACE)
        .borderRadius(8)

      // 轮播图
      Swiper() {
        // 第一张图片
        Image('https://img0.baidu.com/it/u=3758288827,3999282801&fm=253&fmt=auto&app=120&f=JPEG?w=750&h=500')
          .width('100%')
          .height(200)
          .objectFit(ImageFit.Cover)

        // 第二张图片
        Image('https://img0.baidu.com/it/u=3758288827,3999282801&fm=253&fmt=auto&app=120&f=JPEG?w=750&h=500')
          .width('100%')
          .height(200)
          .objectFit(ImageFit.Cover)

        // 第三张图片
        Image('https://img0.baidu.com/it/u=3758288827,3999282801&fm=253&fmt=auto&app=120&f=JPEG?w=750&h=500')
          .width('100%')
          .height(200)
          .objectFit(ImageFit.Cover)
      }
      .width('95%')
      .height(200)
      .borderRadius(8)
      .autoPlay(true)          // 自动播放
      .interval(3000)          // 轮播间隔，单位：毫秒
      .indicator(true)         // 显示指示点
      .loop(true)              // 循环播放
      .duration(400)           // 动画时长，单位：毫秒
      .margin({ bottom: Constants.MD_SPACE});

      // 其他内容
      Text('这是首页内容')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: Constants.LG_SPACE});

      Blank().margin({bottom: 2000});
    }
    .padding(Constants.MD_SPACE)
    .justifyContent(FlexAlign.Start);
  }
}
