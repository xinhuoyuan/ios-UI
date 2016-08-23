//
//  JMClickBtn.m
//  购物车
//
//  Created by apple on 16/8/22.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMClickBtn.h"

@implementation JMClickBtn

- (void)awakeFromNib
{
    //设置边框宽度
    self.layer.borderWidth = 1.0;
    //设置边框颜色
    self.layer.borderColor = [UIColor redColor].CGColor;
    //设置圆角半径
    self.layer.cornerRadius = self.frame.size.width * 0.5;
}


@end
