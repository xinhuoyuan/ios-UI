//
//  ViewController.m
//  图片轮播器-分页功能
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scView;
@property (weak, nonatomic) IBOutlet UIPageControl *pgControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.添加图片
    CGFloat scrollW = self.scView.bounds.size.width;
    CGFloat scrollH = self.scView.bounds.size.height;
    int count = 5;
    for (int i = 0; i<count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        NSString *imgName= [NSString stringWithFormat:@"img_0%d",i+1];
        imageView.image = [UIImage imageNamed:imgName];
        imageView.frame = CGRectMake(i*scrollW, 0, scrollW, scrollH);
        [self.scView addSubview:imageView];
    }
    
    //2.色获知contentSize
    self.scView.contentSize = CGSizeMake( count * scrollW, 0);
    
    //3.开启分页功能
    //标准:以scrollView的尺寸为一页
    self.scView.pagingEnabled = YES;
    
    //4.设置总页数
    self.pgControl.numberOfPages = count;
    
    //5.单页的时候是否隐藏pageControl
    self.pgControl.hidesForSinglePage = YES;
    
    //6.设置pageControl的图片
    [self.pgControl setValue:[UIImage imageNamed:@"current"] forKeyPath:@"_currentPageImage"];
    [self.pgControl setValue:[UIImage imageNamed:@"other"] forKeyPath:@"_pageImage"];
    
    //设置代理
    self.scView.delegate = self;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //四舍五入:int (小数 + 0.5)
    //0.2 --> 0 int(0.2 + 0.5) ＝ 0.7 -> 0
    //0.3 --> 0 int(0.3 + 0.5) = 0.8 -> 0
    //0.9 --> 1 int(0.9 + 0.5) = 1.4 -> 1
    //1.5 --> 2 int(1.5 + 0.5) = 2 -> 2
    //1.计算页码
    int page = (scrollView.contentOffset.x / scrollView.bounds.size.width)+ 0.5;
    //2.设置页码
    self.pgControl.currentPage = page;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
