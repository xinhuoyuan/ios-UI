//
//  ViewController.m
//  autolayout代码中的使用
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

    //1.蓝色的view
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    //禁止autoresizing自动转为约束
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    //2.红色的view
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    //禁止autoresizing自动转为约束
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    /*****添加约束******/
    /*
     NSLayoutAttributeLeft = 1,
     NSLayoutAttributeRight,
     NSLayoutAttributeTop,
     NSLayoutAttributeBottom,
     NSLayoutAttributeLeading,
     NSLayoutAttributeTrailing,
     NSLayoutAttributeWidth,
     NSLayoutAttributeHeight,
     NSLayoutAttributeCenterX,
     NSLayoutAttributeCenterY,
     NSLayoutAttributeBaseline,
     */
    /*
     NSLayoutRelationLessThanOrEqual = -1,
     NSLayoutRelationEqual = 0,
     NSLayoutRelationGreaterThanOrEqual = 1,
     */
    //3.添加蓝色view的约束
    //3.1上边的约束
    NSLayoutConstraint *toplcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:30];
    [self.view addConstraint:toplcs_b];
    //3.2左边的约束
    NSLayoutConstraint *leftlcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30];
    [self.view addConstraint:leftlcs_b];
    //3.3右边的约束
    NSLayoutConstraint *rightlcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30];
    [self.view addConstraint:rightlcs_b];
    //3.4高度约束
    NSLayoutConstraint *hightlcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:50];
    [self.view addConstraint:hightlcs_b];
    
    //4.添加红色view的约束
    //4.2宽度约束
    NSLayoutConstraint *widthlcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [self.view addConstraint:widthlcs_r];
    //4.3高度约束
    NSLayoutConstraint *heightlcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self.view addConstraint:heightlcs_r];
    //4.4顶部约束
    NSLayoutConstraint *toplcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:30];
    [self.view addConstraint:toplcs_r];
    //4.5右边约束
    NSLayoutConstraint *rightlcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    [self.view addConstraint:rightlcs_r];
    
    
}
- (void)test1{
    //1.蓝色的view
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    //禁止autoresizing自动转为约束
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    //2.红色的view
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    //禁止autoresizing自动转为约束
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    /****添加约束****/
    //3.添加蓝色view的约束
    /*
     NSLayoutAttributeLeft = 1,
     NSLayoutAttributeRight,
     NSLayoutAttributeTop,
     NSLayoutAttributeBottom,
     NSLayoutAttributeLeading,
     NSLayoutAttributeTrailing,
     NSLayoutAttributeWidth,
     NSLayoutAttributeHeight,
     NSLayoutAttributeCenterX,
     NSLayoutAttributeCenterY,
     NSLayoutAttributeBaseline,
     */
    /*
     NSLayoutRelationLessThanOrEqual = -1,
     NSLayoutRelationEqual = 0,
     NSLayoutRelationGreaterThanOrEqual = 1,
     */
    //3.1左边约束
    NSLayoutConstraint *leftcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30];
    [self.view addConstraint:leftcs_b];
    //3.2底部约束
    NSLayoutConstraint *bottomlcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-30];
    [self.view addConstraint:bottomlcs_b];
    //3.3右边的约束
    NSLayoutConstraint *rightlcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-30];
    [self.view addConstraint:rightlcs_b];
    //3.4宽度约束
    NSLayoutConstraint *wlcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    [self.view addConstraint:wlcs_b];
    //3.5高度约束
    NSLayoutConstraint *hlcs_b = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:50];
    [self.view addConstraint:hlcs_b];
    //4.添加红色view的约束
    //4.1右边的约束
    NSLayoutConstraint *rightls_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30];
    [self.view addConstraint:rightls_r];
    
    //4.2顶部对齐
    NSLayoutConstraint *toplcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [self.view addConstraint:toplcs_r];
    
    //4.3底部对齐
    NSLayoutConstraint *bottomlcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.view addConstraint:bottomlcs_r];
}

- (void)test{
    
    //1.红色的view
    UIView *reView = [[UIView alloc]init];
    reView.backgroundColor = [UIColor redColor];
    //禁止autoresizing自定转为约束
    reView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:reView];
    
    //2.添加约束
    //2.1宽度约束
    /*
     NSLayoutAttributeLeft = 1,
     NSLayoutAttributeRight,
     NSLayoutAttributeTop,
     NSLayoutAttributeBottom,
     NSLayoutAttributeLeading,
     NSLayoutAttributeTrailing,
     NSLayoutAttributeWidth,
     NSLayoutAttributeHeight,
     NSLayoutAttributeCenterX,
     NSLayoutAttributeCenterY,
     NSLayoutAttributeBaseline,
     */
    
    /*
     NSLayoutRelationLessThanOrEqual = -1,
     NSLayoutRelationEqual = 0,
     NSLayoutRelationGreaterThanOrEqual = 1,
     */
    NSLayoutConstraint *wlcs = [NSLayoutConstraint constraintWithItem:reView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:100];
    [self.view addConstraint:wlcs];
    //2.2高度约束
    NSLayoutConstraint *hlcs = [NSLayoutConstraint constraintWithItem:reView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:100];
    [self.view addConstraint:hlcs];
    //2.3右边的约束
    NSLayoutConstraint *rlcs = [NSLayoutConstraint constraintWithItem:reView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20];
    [self.view addConstraint:rlcs];
    //2.4底部约束
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:reView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20];
    [self.view addConstraint:bottom];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
