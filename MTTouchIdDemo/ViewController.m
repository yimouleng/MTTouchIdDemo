//
//  ViewController.m
//  MTTouchIdDemo
//
//  Created by Eli on 16/1/18.
//  Copyright © 2016年 Ely. All rights reserved.
//

#import "ViewController.h"
#import "MTTouchIdTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = ({
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/2-30/2, self.view.frame.size.width, 30)];
        [button setTitle:@"点击进行Touch ID测试" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickTouchID) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    
    [self.view addSubview:button];
    [self clickTouchID];
    
    
}
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
