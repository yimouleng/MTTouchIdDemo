# MTTouchIdTool
封装的TouchId-指纹验证， 用于登录，支付等指纹验证。block返回,简单易用，低耦合，可自行修改返回枚举，方便集成。

#效果图：

 [![](https://github.com/yimouleng/MTTouchIdDemo/blob/master/TouchId1.png)](https://github.com/yimouleng/MTTouchIdDemo/blob/master/TouchId1.png)
 
  [![](https://github.com/yimouleng/MTTouchIdDemo/blob/master/TouchId2.png)](https://github.com/yimouleng/MTTouchIdDemo/blob/master/TouchId2.png)

## 使用方法

  通过单例调用，block方法，返回成功，失败需要自行判断，根据`LAError` 系统枚举判断。
  
```
- (void)clickTouchID
{
    [[MTTouchIdTool sharedInstance]evaluatePolicy:@"这是测试的Touch ID" fallbackTitle:@"输入密码" SuccesResult:^{
        NSLog(@"验证成功");
    } FailureResult:^(LAError result) {
        switch (result) {
            case LAErrorSystemCancel:
            {
                 NSLog(@"切换到其他APP");
                break;
            }
            case LAErrorUserCancel:
            {
                NSLog(@"用户取消验证Touch ID");
                
                break;
            }
            case LAErrorTouchIDNotEnrolled:
            {
                NSLog(@"TouchID is not enrolled");
                break;
            }
            case LAErrorUserFallback:
            {

                NSLog(@"用户选择输入密码");

                break;
            }
            default:
            {
  
                NSLog(@"其他情况");

                break;
            }
        
        }
    }];
}

    
```

###声明

使用有问题请提问，如有BUG或者建议等，欢迎拉请求或者联系我。

文章地址 [点此链接](http://yimouleng.com/2014/12/17/ios-TouchID/)
