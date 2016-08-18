//
//  ViewController.m
//  UIScrollView的常见属性
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
    // Do any additional setup after loading the view, typically from a nib.
//    UIActivityIndicatorView *indicatorView  = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    indicatorView.center = CGPointMake(self.ScView.bounds.size.width * 0.5, -40);
//    [indicatorView startAnimating];
//    [self.ScView addSubview:indicatorView];
    //不管有没有设置contenSize,总是有弹簧效果（下拉刷星）
//    self.ScView.alwaysBounceVertical = YES;
//    self.ScView.alwaysBounceHorizontal = YES;
    
    //1.UIImageView
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imgView = [[UIImageView alloc]initWithImage:image];
    [self.ScView addSubview:imgView];
    
    //2.设置contentSize
    self.ScView.contentSize = image.size;
    
    //3.是否有弹簧效果
    self.ScView.bounces = NO;
    
    //4.是否显示滚动条
    self.ScView.showsHorizontalScrollIndicator = NO;
    self.ScView.showsVerticalScrollIndicator = NO;
    
    //注意点:千万不要通过索引去subviews数组访问scrollView子控件
//    [self.ScView.subviews.firstObject removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
