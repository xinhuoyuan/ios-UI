//
//  ViewController.m
//  内容缩放
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scView;
@property (weak, nonatomic) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.创建UIImageView
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imgView = [[UIImageView alloc]initWithImage:image];
    [self.scView addSubview:imgView];
    self.imageView = imgView;
    
    //2.设置contentSize
    self.scView.contentSize = image.size;
    
    //3.设置缩放比例
    self.scView.minimumZoomScale = 0.2;
    self.scView.maximumZoomScale = 2.0;
    
    self.scView.delegate = self;
}

#pragma mark - UIScrollViewDelegate
/**
 *      反悔需要缩放的子控件(scrollView的子控件)
 */
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidZoom");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
