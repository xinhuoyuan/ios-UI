//
//  ViewController.m
//  通过xib自定义商品的view
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//


#import "ViewController.h"
#import "JMShopView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //加载xib
//    JMShopView *shopView = [[[NSBundle mainBundle]loadNibNamed:@"JMShopView" owner:nil options:nil]lastObject];
//    JMShopView *shopView = [[JMShopView alloc]initWithFrame:CGRectMake(100, 100, 80, 100)];
    JMShopView *shopView = [JMShopView shopView];
    shopView.frame = CGRectMake(100, 100, 80, 100);
    
    //给子控件设置属性
//    UIImageView *imageView = [shopView viewWithTag:100];
//    UILabel *titleLabel = [shopView viewWithTag:200];
//    
//    imageView.image = [UIImage imageNamed:@"danjianbao"];
//    titleLabel.text = @"单肩包";
    [shopView setName:@"单肩包"];
    [shopView setIcon:@"danjianbao"];
    [self.view addSubview:shopView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
