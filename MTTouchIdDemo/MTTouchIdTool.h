//
//  MTTouchIdTool.h
//  MTTouchIdDemo
//
//  Created by Eli on 16/1/18.
//  Copyright © 2016年 Ely. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>

typedef NS_ENUM(NSInteger, TouchIdValidationResult)
{
    kTouchIdSystemCancel,   // 切换到其他APP
    kTouchIdUserCancel,     // 用户取消验证Touch ID
    kTouchIdUserFallback,   // 用户点击其他按钮
    kTouchIdNotEnrolled,    // 不支持TouchId机型
    kTouchIdPasscodeNotSet, // 没有设置验证密码
    kTouchIdOther           // 其他
};//这个枚举并没有用到,可将它删除，也可以自定义替换Block返回

@interface MTTouchIdTool : NSObject


/**
 *  TouchIdValidationFailureBack
 *
 *  @param result LAError枚举
 */
typedef void(^TouchIdValidationFailureBack)(LAError result);

+ (instancetype) sharedInstance;

/**
 *  TouchId 验证
 *
 *  @param localizedReason TouchId信息
 *  @param title           验证错误按钮title
 *  @param backSucces      成功返回Block
 *  @param backFailure     失败返回Block
 */
- (void)evaluatePolicy:(NSString *)localizedReason
         fallbackTitle:(NSString *)title
          SuccesResult:(void(^)())backSucces
         FailureResult:(TouchIdValidationFailureBack)backFailure;

@end
