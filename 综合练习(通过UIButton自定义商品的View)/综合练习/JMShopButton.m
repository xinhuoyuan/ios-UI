//
//  JMShopButton.m
//  综合练习
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMShopButton.h"
#import "JMShop.h"

@implementation JMShopButton

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //文本居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //文本颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

#pragma mark - 布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    //1.获取自身的尺寸
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    //设置子控件的frame
    self.imageView.frame = CGRectMake(0, 0, width, width);
    self.titleLabel.frame = CGRectMake(0, width, width, height - width);
}

#pragma mark - 设置子控件的数据

- (void)setShop:(JMShop *)shop
{
    _shop = shop;
    [self setImage:[UIImage imageNamed:shop.icon] forState:UIControlStateNormal];
    [self setTitle:shop.name forState:UIControlStateNormal];
}

@end
