//
//  ViewController.m
//  FJStatusBarHUD
//
//  Created by  高帆 on 16/5/23.
//  Copyright © 2016年 GF. All rights reserved.
//

#import "ViewController.h"
#import "FJStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)succeed {
    [FJStatusBarHUD fj_showSuccess:@"成功!"];
}

- (IBAction)error {
    [FJStatusBarHUD fj_showError:@"失败!"];
}

- (IBAction)loading {
    [FJStatusBarHUD fj_showLoading:@"正在加载中..."];
}

- (IBAction)message {
    [FJStatusBarHUD fj_showMessage:@"文字"];
}

- (IBAction)hide {
    [FJStatusBarHUD fj_hide];
}

@end
