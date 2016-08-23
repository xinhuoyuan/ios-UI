//
//  ViewController.m
//  图片轮播器(包装)
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMPageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    JMPageView *pageView = [JMPageView pageView];
    pageView.backgroundColor = [UIColor redColor];
    pageView.frame = CGRectMake(0, 20, 320, 150);
    pageView.imageNames = @[@"img_01",@"img_02",@"img_03",@"img_04",@"img_05"];
    
    [self.view addSubview:pageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
