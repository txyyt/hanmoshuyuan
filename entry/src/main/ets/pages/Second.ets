import { cloudDatabase } from '@kit.CloudFoundationKit';

@Entry
@Component
export struct TestPage {
  aboutToAppear() {
    this.testQuery(); // 页面加载时触发测试查询
  }

  testQuery() {

    let databaseZone = cloudDatabase.zone('Hanmoshuyuan');
    console.error('databaseZone:', databaseZone);
    if (!databaseZone) {
      console.error('Database zone initialization failed.');
      return;
    }

  }

  build() {
    Column() {
      Text('Testing Cloud Database Query...')
        .fontSize(20)
        .margin(20);
    }
  }
}

