//
//  JMCar.m
//  UIScrollView的delegate(注意点)
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMCar.h"

@implementation JMCar

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll");
}

- (void)dealloc
{
    NSLog(@"dealoc - 车刮里");
}
@end
