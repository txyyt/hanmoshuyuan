import auth from '@hw-agconnect/auth';
import { VerifyCodeAction } from '@hw-agconnect/auth';
import { BusinessError } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';

@Entry
@Component
export struct LoginPage {
  private phoneNumber: string = ''; // 用户输入的手机号
  private countryCode: string = '86'; // 默认国家代码
  private verifyCode: string = ''; // 用户输入的验证码
  private password: string = ''; // 用户输入的密码

  // 获取验证码方法
  private requestVerifyCode() {
    if (!this.phoneNumber) {
      console.error('手机号不能为空');
      return;
    }

    auth.requestVerifyCode({
      action: VerifyCodeAction.REGISTER_LOGIN, // 注册或登录验证码
      lang: 'zh_CN', // 语言
      sendInterval: 60, // 发送间隔
      verifyCodeType: {
        phoneNumber: this.phoneNumber,
        countryCode: "86",
        kind: 'phone', // 手机类型
      }
    }).then(() => {
      console.info('验证码发送成功');
    }).catch((error: Error) => {
      console.error('验证码发送失败', error);
    });
  }

  // 注册用户方法
  private registerUser() {
    if (!this.phoneNumber || !this.verifyCode || !this.password) {
      console.error('手机号、验证码或密码不能为空');
      return;
    }

    auth.createUser({
      kind: 'phone',
      countryCode: this.countryCode,
      phoneNumber: this.phoneNumber,
      password: this.password, // 设置用户密码
      verifyCode: this.verifyCode // 验证码
    }).then(() => {
      console.info('注册成功');
      router.pushUrl({ url: 'pages/Index' }).then(() => {
        console.info('跳转到首页成功');
      }).catch((err: BusinessError) => {
        console.error(`跳转失败，错误码：${err.code}，信息：${err.message}`);
      });
    }).catch((error: Error) => {
      console.error('注册失败', error);
    });
  }

  build() {
    Column() {
      // 页面标题
      Text('用户注册')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 });

      // 手机号输入框
      TextInput({
        placeholder: '请输入手机号',
        text: this.phoneNumber,
      })
        .onChange((value: string) => {
          this.phoneNumber = value; // 更新手机号
        })
        .type(InputType.Number)
        .margin({ bottom: 10 });

      // 获取验证码按钮
      Button('获取验证码')
        .onClick(() => {
          this.requestVerifyCode();
        })
        .margin({ bottom: 10 });

      // 验证码输入框
      TextInput({
        placeholder: '请输入验证码',
        text: this.verifyCode,
      })
        .onChange((value: string) => {
          this.verifyCode = value; // 更新验证码
        })
        .type(InputType.Number)
        .margin({ bottom: 10 });

      // 密码输入框
      TextInput({
        placeholder: '请输入密码',
        text: this.password,
      })
        .onChange((value: string) => {
          this.password = value; // 更新密码
        })
        .type(InputType.Password)
        .margin({ bottom: 20 });

      // 注册按钮
      Button('注册')
        .onClick(() => {
          this.registerUser();
        })
        .fontSize(16)
        .backgroundColor('#0078D7')
        .fontColor(Color.White)
        .margin({ top: 20 });
    }
    .padding(20);
  }
}