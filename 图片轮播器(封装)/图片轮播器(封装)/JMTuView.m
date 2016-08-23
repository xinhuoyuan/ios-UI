//
//  JMTuView.m
//  图片轮播器(封装)
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMTuView.h"

@interface JMTuView()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scView;
@property (weak, nonatomic) IBOutlet UIPageControl *pgControl;
//定时器
@property (nonatomic,strong)NSTimer *timer;
@end

@implementation JMTuView

- (void)awakeFromNib
{
    //1.单页的时候是否隐藏pageControl
    self.pgControl.hidesForSinglePage = YES;
    
    //2.设置pageControl的图片
    [self.pgControl setValue:[UIImage imageNamed:@"current"] forKeyPath:@"_currentPageImage"];
    [self.pgControl setValue:[UIImage imageNamed:@"other"] forKeyPath:@"_pageImage"];
    
    //3.开启定时器
    [self startTimer];
}

+ (instancetype)tuView
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}

- (void)setImages:(NSArray *)images
{
    _images = images;
    //移除之前添加的
    //让subviews这个数组中每一个对性爱那个都执行removeFromSuperview
    [self.scView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //1.根据图片名称个数创建ImageView添加到scrollView
    CGFloat scrollW = self.scView.frame.size.width;
    CGFloat scrollH = self.scView.frame.size.height;
    NSInteger count = images.count;
    for (int i = 0; i<count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:images[i]];
        imageView.frame = CGRectMake(i * scrollW, 0, scrollW, scrollH);
        [self.scView addSubview:imageView];
    }
    
    //2.设置contentSize
    self.scView.contentSize = CGSizeMake( count * scrollW, 0);
    
    //3.设置总页数
    self.pgControl.numberOfPages = count;
}

#pragma mark - 定时器操作
- (void)startTimer
{
    //返回一个子哦那个执行的定时器对象
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(nextPage:) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    [self.timer invalidate];
}

- (void)nextPage:(NSTimer *)timer
{
    //计算下一页的页码
    NSInteger page = self.pgControl.currentPage + 1;
    
    //2.超过了最后一页
    
    if (page == self.images.count) {
        page = 0;
    }
    //滚到下一页
    [self.scView setContentOffset:CGPointMake(page *  self.scView.frame.size.width, 0) animated:YES];
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //1.计算页码
    int page = (int)( scrollView.contentOffset.x / scrollView.frame.size.width + 0.5 );
    //设置页码
    self.pgControl.currentPage = page;
}

//用户开始拖拽scrollView时，停止定时器
 -(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

//用户已经停止拖拽scrollView时，开启定时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

@end
