//
//  ViewController.m
//  UIScrollView的contentoffset,contentInset
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

    //1.UIImageView
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    [self.ScView addSubview:imageView];
    
    //设置ontentSize
    self.ScView.contentSize = image.size;
    
    //3.内容的偏移量
    //作用1：控制内容滚动的位置
    //作用2：得知内容滚动的位置
    self.ScView.contentOffset = CGPointMake(0, -100);
    
    //4.内边距
    self.ScView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
}


//点击控制器的view会自动调用这个方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.ScView.contentOffset = CGPointMake(-100, -100);
}

#pragma mark - 按钮的点击
/**
 *  上
 */
- (IBAction)up {
//    [UIView animateWithDuration:2.0 animations:^{
//        CGPoint offset = self.ScView.contentOffset;
//        offset.y = 0;
//        self.ScView.contentOffset = offset;
//        self.ScView.contentOffset = CGPointMake(self.ScView.contentOffset.x, 0);
//    }];
    [self.ScView setContentOffset:CGPointMake(self.ScView.contentOffset.x, 0) animated:YES];
}
/**
 *  下
 */
- (IBAction)down {
    CGFloat offsetX = self.ScView.contentOffset.x;
    CGFloat offsetY = self.ScView.contentSize.height - self.ScView.frame.size.height;
    [self.ScView setContentOffset:CGPointMake(offsetX, offsetY) animated:YES];
}

/**
 *  左
 */
- (IBAction)left {
    
    [self.ScView setContentOffset:CGPointMake(0, self.ScView.contentOffset.y) animated:YES];
}
/**
 *  右
 */
- (IBAction)right {
    
    [self.ScView setContentOffset:CGPointMake(self.ScView.contentSize.width - self.ScView.bounds.size.width, self.ScView.contentOffset.y) animated:YES];
}

/**
 *  右上
 */
- (IBAction)rightUp {
    [self.ScView setContentOffset:CGPointMake(self.ScView.contentSize.width - self.ScView.frame.size.width, 0) animated:YES];
}

/**
 *  左下
 */
- (IBAction)leftDown {
    [self.ScView setContentOffset:CGPointMake(0, self.ScView.contentSize.height - self.ScView.frame.size.height) animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
