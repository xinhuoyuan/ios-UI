//
//  ViewController.m
//  UIScrollView的基本使用
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *ScView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.红色的view
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(0, 0, 50, 50);
    [self.ScView addSubview:redView];
    //默认scrollView设置该属性为YES
    self.ScView.clipsToBounds = YES;
    //2.设置内容尺寸（滚动范围）
    //可滚动尺寸:contSize尺寸 减去 scrollView的尺寸
    //出一点：contentSize的尺寸小于或者等于scrollView的尺寸是不可以滚动的
    self.ScView.contentSize = CGSizeMake(325, 225);
    
    //3.是否能够滚动
//    self.ScView.scrollEnabled = NO;

    //4.是否能够跟用户交互(响应用户的点击等操作)
    //注意点:设置userInteractionEnabled = NO,scrollView以及内部所有的子控件都不能跟用户交互
//    self.ScView.userInteractionEnabled = NO;
    
    /*
    UIButton *btn = nil;
    btn.enabled = NO;
    btn.userInteractionEnabled = NO;
    UIControlStateNormal;
    UIControlStateHighlighted;
    //注意点：只有设置按钮的enabled = NO才能达到这个状态
    //设置按钮的userInteractionEnabled = NO 是达不到这个状态
    UIControlStateDisabled;
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
