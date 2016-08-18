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

//定时器
@property (weak, nonatomic) NSTimer *timer;
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
    
    //取消弹簧效果
    self.scView.bounces = NO;
    
    //隐藏滚动条
    self.scView.showsHorizontalScrollIndicator = NO;
    self.scView.showsVerticalScrollIndicator = NO;
    
    //开启定时器
    [self startTimer];
}

//线程
//主线程:程序已启动，系统会默认创建的一条线程
//主线程的作用：显示刷新UI界面，处理与用户的交互事件
//多线程的原理;1s ---> 一万个0.0001s
#pragma mark - 定时器相关的代码
- (void)startTimer
{
    //返回一个自动执行的定时器对象
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage:) userInfo:@"123" repeats:YES];
    //NSDefaultRunLoopMode(默认)：同一时间只能执行一个任务
    //NSRunLopCommonModes(公用):可以分配一定的时间执行其他任务
    //作用:修改timer在runLoop中的模式为NSRunLoopCommonModes
    //目的:不管主线程在做什么操作，都会分配一定的时间处理定时器
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    [self.timer invalidate];
}

//滚动到下一页
- (void)nextPage:(NSTimer *)timer
{
    //计算下一页的页码
    NSInteger page = self.pgControl.currentPage + 1;
    //跳到了最后一页
    if (page == 5) {
        page = 0;
    }
    //滚动到下一页
    [self.scView setContentOffset:CGPointMake(page * self.scView.bounds.size.width, 0) animated:YES];
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

//用户即将开始拖拽的时候，停止定时器
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

//用户已经停止拖拽scrollView时，开启定时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
