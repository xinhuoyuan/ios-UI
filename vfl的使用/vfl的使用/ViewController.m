//
//  ViewController.m
//  vfl的使用
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.蓝色view
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    //禁止autoresizing自动转为约束
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    //2.红色view
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    //禁止autoresizing自动转为约束
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(redView,blueView);
    
    NSDictionary *metrics = @{@"space":@30};
    
    NSString *hvfl = @"H:|-space-[blueView]-space-|";
    NSArray *hlcs = [NSLayoutConstraint constraintsWithVisualFormat:hvfl options:kNilOptions metrics:metrics views:views];
    [self.view addConstraints:hlcs];
    
   
    NSString *hvfl1 = @"H:[redView]-space-|";
    NSArray *hlcs1 = [NSLayoutConstraint constraintsWithVisualFormat:hvfl1 options:kNilOptions metrics:metrics views:views];
    [self.view addConstraints:hlcs1];
    
    NSLayoutConstraint *width_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [self.view addConstraint:width_r];
    
    NSString *vvfl = @"V:|-space-[blueView(50)]-space-[redView(==blueView)]";
    NSArray *vlcs = [NSLayoutConstraint constraintsWithVisualFormat:vvfl options:NSLayoutFormatAlignAllRight metrics:metrics views:views];
    [self.view addConstraints:vlcs];
}

- (void)test1
{
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
    
    //3.添加约束
    //3.水平约束
    //    NSDictionary *views = @{r
    //                            @"redView":redView,
    //                            @"blueView":blueView
    //                            };
    NSDictionary *views = NSDictionaryOfVariableBindings(redView,blueView);
    NSDictionary *metrics = @{@"space":@30};
    NSString *hvfl = @"H:|-space-[blueView]-space-[redView(==blueView)]-space-|";
    NSArray *hlcs = [NSLayoutConstraint constraintsWithVisualFormat:hvfl options:NSLayoutFormatAlignAllTop | NSLayoutFormatAlignAllBottom metrics:metrics views:views];
    [self.view addConstraints:hlcs];
    
    //3.2垂直放心
    NSString *vvfl = @"V:[blueView(50)]-space-|";
    NSArray *vlcs = [NSLayoutConstraint constraintsWithVisualFormat:vvfl options:kNilOptions metrics:metrics views:views];
    [self.view addConstraints:vlcs];
    
    //4.2顶部对齐
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
     NSLayoutAttributeLastBaseline = NSLayoutAttributeBaseline,
     NSLayoutAttributeFirstBaseline NS_ENUM_AVAILABLE_IOS(8_0),
     */
    //    NSLayoutConstraint *toplcs_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    //    [self.view addConstraint:toplcs_r];
    //
    //    //底部对齐
    //    NSLayoutConstraint *bottom_r = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    //    [self.view addConstraint:bottom_r];
}

- (void)test
{
    //1.红色的view
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    //禁止sutoresizing自动转为约束
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    //2.添加约束
    //2.1水平方向
    NSString *hvfl = @"H:|-space-[abc]-space-|";
    NSDictionary *views = @{@"abc":redView};
    NSDictionary *metrics = @{@"space":@40};
    NSArray *hlcs = [NSLayoutConstraint constraintsWithVisualFormat:hvfl options:kNilOptions metrics:metrics views:views];
    [self.view addConstraints:hlcs];
    
    //2.2垂直方向
    NSString *vvfl = @"V:[abc(40)]-space-|";
    NSArray *vlcs = [NSLayoutConstraint constraintsWithVisualFormat:vvfl options:kNilOptions metrics:metrics views:views];
    [self.view addConstraints:vlcs];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
