//
//  JMPageView.m
//  图片轮播器(包装)
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMPageView.h"

@interface JMPageView()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scView;
@property (weak, nonatomic) IBOutlet UIPageControl *pgControl;
//定时器
@property (weak, nonatomic) NSTimer *timer;
@end

@implementation JMPageView

- (void)awakeFromNib
{
    /*
     UIViewAutoresizingNone                 = 0,
     UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
     UIViewAutoresizingFlexibleWidth        = 1 << 1,
     UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
     UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
     UIViewAutoresizingFlexibleHeight       = 1 << 4,
     UIViewAutoresizingFlexibleBottomMargin = 1 << 5
     */
    self.scView.autoresizingMask =  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.pgControl.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
    
    self.scView.pagingEnabled = YES;
    self.scView.bounces = NO;
    self.scView.showsHorizontalScrollIndicator = NO;
    self.scView.showsVerticalScrollIndicator = NO;
    //1.单页的时候是否隐藏pageControl
    self.pgControl.hidesForSinglePage = YES;
    //2.设置pageControl图片
    [self.pgControl setValue:[UIImage imageNamed:@"current"] forKeyPath:@"_currentPageImage"];
    [self.pgControl setValue:[UIImage imageNamed:@"other"] forKeyPath:@"_pageImage"];
    
    [self startTimer];
}


+ (instancetype)pageView
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //根据最新的crollView尺寸计算imageView的x
    CGFloat scrollW = self.scView.frame.size.width;
    for (int i = 0; i<self.scView.subviews.count; i++) {
        UIImageView *imageView = self.scView.subviews[i];
        CGRect frame = imageView.frame;
        frame.origin.x = i * scrollW;
        imageView.frame = frame;
    }
    //设置contentSize
    self.scView.contentSize = CGSizeMake(self.scView.subviews.count * scrollW, 0);
}

- (void)setImageNames:(NSArray *)imageNames
{
    _imageNames = imageNames;
    
    
    [self.scView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    NSInteger count = self.imageNames.count;
    
    for (int i = 0 ; i<count; i++) {
        UIImageView *imageView =[[UIImageView alloc]init];
        imageView.autoresizingMask =UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        imageView.image = [UIImage imageNamed:imageNames[i]];
        imageView.frame = CGRectMake(i * self.scView.frame.size.width, 0, self.scView.frame.size.width, self.scView.frame.size.height);
        [self.scView addSubview:imageView];
    }
    
    // 设置contentSize
    self.scView.contentSize = CGSizeMake(count * self.scView.frame.size.width, 0);
    
    self.pgControl.numberOfPages = imageNames.count;
    
}

#pragma mark - 定时器方法
- (void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}


- (void)stopTimer
{
    [self.timer invalidate];
}

-(void)nextPage
{
    NSInteger page = self.pgControl.currentPage+1;
    if (page == self.imageNames.count) {
        page = 0;
    }
    [self.scView setContentOffset:CGPointMake(page * self.scView.frame.size.width, 0) animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x / scrollView.frame.size.width + 0.5;
    
    self.pgControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}



@end
