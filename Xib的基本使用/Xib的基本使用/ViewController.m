//
//  ViewController.m
//  Xib的基本使用
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //展示xib
    
    //方式一
//    UIView *carView = [[[NSBundle mainBundle]loadNibNamed:@"CarView" owner:nil options:nil]lastObject];
//    carView.frame = CGRectMake(0, 100, 200, 50);
//    carView.clipsToBounds = YES;
//    [self.view addSubview:carView];
    
    //方式二
    UINib *nib = [UINib nibWithNibName:@"CarView" bundle:nil];
    UIView *carView1 = [[nib instantiateWithOwner:nil options:nil]firstObject];
    [self.view addSubview:carView1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
