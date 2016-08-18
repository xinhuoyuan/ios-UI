//
//  ViewController.m
//  UIScrollView的delegate(注意点)
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMCar.h"

/*
 1. 任何oc代理都可以作为scrollView的代理
 2.苹果设计的代理是weak
 */

@interface ViewController ()

//车
@property (nonatomic,strong)JMCar *car;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.frame = CGRectMake(0, 20, 300, 200);
    [self.view addSubview:scrollView];
    
    //2.创建UIImageView
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imgView = [[UIImageView alloc]initWithImage:image];
    [scrollView addSubview:imgView];
    
    //3.设置contentSize
    scrollView.contentSize = image.size;
    
    //4.设置代理
    self.car = [[JMCar alloc]init];
    scrollView.delegate = self.car;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
