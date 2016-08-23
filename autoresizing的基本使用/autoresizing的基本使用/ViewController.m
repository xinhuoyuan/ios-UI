//
//  ViewController.m
//  autoresizing的基本使用
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    
    CGFloat X = self.view.frame.size.width - 100;
    CGFloat Y = self.view.frame.size.height - 100;
    
    redView.frame = CGRectMake(X, Y, 100, 100);

    /*
     UIViewAutoresizingNone
     UIViewAutoresizingFlexibleLeftMargin   距离父控件的左边是可以伸缩的
     UIViewAutoresizingFlexibleWidth        距离父控件的底部是可以伸缩的
     UIViewAutoresizingFlexibleRightMargin  距离父控件的右边是可以伸缩的
     UIViewAutoresizingFlexibleTopMargin    距离父控件的顶部是可以伸缩的
     UIViewAutoresizingFlexibleHeight       高度会跟随父控件的高度进行伸缩
     UIViewAutoresizingFlexibleBottomMargin 宽度会跟随父控件的宽度进行伸缩
     */
    redView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    
    [self.view addSubview:redView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
