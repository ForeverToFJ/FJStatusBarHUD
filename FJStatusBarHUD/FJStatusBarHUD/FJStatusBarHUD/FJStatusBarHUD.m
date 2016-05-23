//
//  FJStatusBarHUD.m
//  FJStatusBarHUD
//
//  Created by  高帆 on 16/5/23.
//  Copyright © 2016年 GF. All rights reserved.
//

#import "FJStatusBarHUD.h"

@implementation FJStatusBarHUD

/**
 *  全局窗口
 */
static UIWindow *window_;
/**
 *  定时器
 */
static NSTimer *timer_;

/**
 *  显示窗口
 */
+ (void)fj_showWindow {
    // frame数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    // 显示窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor redColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:0.5 animations:^{
        window_.frame = frame;
    }];
}

+ (void)fj_showMessage:(NSString *)msg image:(UIImage *)image {
    // 停止上次定时器
    [timer_ invalidate];
    
    // 显示窗口
    [self fj_showWindow];
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:msg forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    button.frame = window_.bounds;
    [window_ addSubview:button];
    
    // 定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(fj_hide) userInfo:nil repeats:NO];
}

+ (void)fj_showSuccess:(NSString *)msg {
    [self fj_showMessage:msg image:[UIImage imageNamed:@"FJStatusBarHUD.bundle/check"]];
}

+ (void)fj_showError:(NSString *)msg {
    [self fj_showMessage:msg image:[UIImage imageNamed:@"FJStatusBarHUD.bundle/error"]];
}

+ (void)fj_showLoading:(NSString *)msg {
    // 停止上次定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 显示窗口
    [self fj_showWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:13];
    label.frame =window_.bounds;
    // 居中
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    // 添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    // 文字宽度
    CGFloat magW = [msg sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]}].width;
    CGFloat centerX = (window_.frame.size.width - magW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}

+ (void)fj_showMessage:(NSString *)msg {
    [self fj_showMessage:msg image:nil];
}

+ (void)fj_hide {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = -frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

@end
