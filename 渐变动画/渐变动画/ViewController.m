//
//  ViewController.m
//  渐变动画
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *showView;


@end

@implementation ViewController

//平移
- (IBAction)moveAnim {
    //渐变动画
    //方式一
    //1.开始动画
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1.0];
//    //2.动画代码
//    CGRect frame = self.showView.frame;
//    frame.origin.y -= 50;
//    self.showView.frame = frame;
//    //3.提交动画
//    [UIView commitAnimations];
//    

    //方式二
//    [UIView animateWithDuration:2.0 animations:^{
//       //1.动画代码
//        CGRect frame = self.showView.frame;
//        frame.origin.y -= 50;
//        self.showView.frame= frame;
//    }];
    
//    [UIView animateWithDuration:1.0 animations:^{
//        //执行动画
//        CGRect frame = self.showView.frame;
//        frame.origin.y -= 50;
//        self.showView.frame = frame;
//    } completion:^(BOOL finished) {
//        self.showView.backgroundColor = [UIColor blackColor];
//    }];
    
    /*
     UIViewAnimationOptionCurveEaseInOut  动画开始/结束比较缓慢,中间相对较快
     UIViewAnimationOptionCurveEaseIn     动画开始比较缓慢
     UIViewAnimationOptionCurveEaseOut    动画结束比较缓慢
     UIViewAnimationOptionCurveLinear     线性 --> 匀速
     */
    
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect frame = self.showView.frame;
        frame.origin.y += 50;
        self.showView.frame= frame;
    } completion:^(BOOL finished) {
        self.showView.backgroundColor =[UIColor greenColor];
    }];
}
//缩放
- (IBAction)frameChangeAnim {
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect frame = self.showView.frame;
        frame.size = CGSizeMake(10, 15);
        self.showView.frame = frame;
    } completion:^(BOOL finished) {
        NSLog(@"动画完成");
    }];
}
//透明度动画
- (IBAction)alphaChangeAnim {
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.showView.alpha -= 0.9;
    } completion:^(BOOL finished) {
        self.showView.alpha += 0.9;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
