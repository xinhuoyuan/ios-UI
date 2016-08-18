
//
//  JMTestViewController.m
//  综合练习
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMTestViewController.h"

@interface JMTestViewController ()

@end

@implementation JMTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    //2.1创建商品的view
    UIView *shopView = [[UIView alloc]init];
    //2.设置frame
    shopView.frame = CGRectMake(0, 0, 80, 100);
    //3.设置背景颜色
    shopView.backgroundColor = [UIColor greenColor];
    //4.添加到购物车
    [self.view addSubview:shopView];
    //5.创建商品的UIImageView对象
    UIImageView *iconView = [[UIImageView alloc]init];
    iconView.frame = CGRectMake(0, 0, 80, 80);
    iconView.backgroundColor = [UIColor blueColor];
    [shopView addSubview:iconView];
    //6.创建商品标题对象
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.frame = CGRectMake(0, 80, 80, 20);
    titleLabel.backgroundColor = [UIColor yellowColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [shopView addSubview:titleLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
