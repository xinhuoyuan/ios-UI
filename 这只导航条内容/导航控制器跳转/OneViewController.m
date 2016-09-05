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

- (void)viewDidLoad
{
    [super viewDidLoad];
    //设置导航条内容
    //由栈顶控制器来决定
    //设置标题
    self.navigationItem.title = @"根控制器";
    //设置标题视图
    self.navigationItem.titleView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    //设置左侧表态愿意
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"left" style:0 target:self action:@selector(btnClick)];
    
//    //设置右边图片
//    UIImage *image = [UIImage imageNamed:@"navigationbar_friendsearch"];
//    UIImage *oriImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:oriImage style:0 target:self action:@selector(btnClick)];

    //设置右侧是一个自定义的view(位置不需要自己决定，但是大小要自己决定)
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"navigationbar_friendsearch"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] forState:UIControlStateHighlighted];
    //让按钮自适应大小
    [btn sizeToFit];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
}

- (void)btnClick
{
    NSLog(@"%s",__func__);
}


- (IBAction)Jump2View {
    //跳转到第二个控制器
    //self.navigationController获取当前所在的导航控制器
    TwoViewController *vc = [[TwoViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
