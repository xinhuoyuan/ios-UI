//
//  OneViewController.m
//  导航控制器跳转
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"

@interface OneViewController()

@end

@implementation OneViewController
- (IBAction)Jump2View {
    //跳转到第二个控制器
    //self.navigationController获取当前所在的导航控制器
    TwoViewController *vc = [[TwoViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
