//
//  FJStatusBarHUD.h
//  FJStatusBarHUD
//
//  Created by  高帆 on 16/5/23.
//  Copyright © 2016年 GF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FJStatusBarHUD : NSObject

/**
 *  显示自定义信息
 */
+ (void)fj_showMessage:(NSString *)msg image:(UIImage *)image;
/**
 *  显示成功信息
 */
+ (void)fj_showSuccess:(NSString *)msg;
/**
 *  显示失败信息
 */
+ (void)fj_showError:(NSString *)msg;
/**
 *  显示正在处理的信息
 */
+ (void)fj_showLoading:(NSString *)msg;
/**
 *  显示普通文字
 */
+ (void)fj_showMessage:(NSString *)msg;
/**
 *  隐藏
 */
+ (void)fj_hide;

@end
