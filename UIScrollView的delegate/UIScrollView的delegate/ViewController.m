//
//  ViewController.m
//  UIScrollView的delegate
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.UIScrollView
    UIScrollView *scView = [[UIScrollView alloc]init];
    scView.backgroundColor = [UIColor redColor];
    scView.frame = CGRectMake(0, 20, 300, 200);
    [self.view addSubview:scView];
    
    //注意点：通过代码创建scrollView，一开始subviews这个数组为0
//    NSLog(@"%@",scView.subviews);
    
    //1.创建UIImageView
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imgView = [[UIImageView alloc]initWithImage:image];
    [scView addSubview:imgView];
    
    //2.设置contentSize
    scView.contentSize = image.size;
    
    //3.设置代理
    scView.delegate = self;
}
#pragma mark - UIScrollViewDelegate 代理方法
//当scrollView正在滚动的时候就会调用这个方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll");
}

//用户即将开始拖拽scrollView的时候就会调用这个方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}

//用户即将停止拖拽scrollView时就会调用这个方法
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"scrollViewWillEndDragging");
}
//用户已经停止拖拽scrollView时就会调用这个方法
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (decelerate == NO) {
        NSLog(@"用户已经停止拖拽scrollView");
    }else
    {
        NSLog(@"用户已经停止拖拽scrollView,但是scrollView由于惯性会继续滚动，减速");
    }
}

//scrollView减速完毕会调用，停止滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
