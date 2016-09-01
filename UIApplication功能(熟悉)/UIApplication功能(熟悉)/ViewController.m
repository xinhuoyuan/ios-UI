//
//  ViewController.m
//  UIApplication功能(熟悉)
//
//  Created by apple on 16/9/1.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)beganValue:(id)sender {
    //设置提醒图标
    //1.获取UIApplication对象
    UIApplication *app = [UIApplication sharedApplication];
    //2.注册用户通知
    UIUserNotificationSettings *notice = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    [app registerUserNotificationSettings:notice];
    //3.设置提醒值
    app.applicationIconBadgeNumber = 10;
}

//设置联网状态
- (IBAction)netState:(id)sender {
    //1.获取UIApplication对象
    UIApplication *app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = YES;
}

//设置状态栏
- (IBAction)statueBar:(id)sender {
    //1.获取UIApplication对象
    UIApplication *app = [UIApplication sharedApplication];
    //隐藏状态栏
//    app.statusBarHidden = YES;
//    app.statusBarStyle = UIStatusBarStyleLightContent;
    
    [app setStatusBarHidden:YES animated:YES];
}

//隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

//状态栏样式
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

//打开一个URL
- (IBAction)openURL:(id)sender {
    //1.获取UIApplication对象
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    [app openURL:url];
}

@end
