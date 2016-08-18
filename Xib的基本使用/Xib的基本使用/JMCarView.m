//
//  JMCarView.m
//  Xib的基本使用
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMCarView.h"

@implementation JMCarView


/**
 *  子控件的初始化
 */

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

//初始化
- (void)setUp
{
    //创建图片的UIImageView对象
    
    //创建标题对象(UILabel)
    
    //创建子标题对象(UILabel)
    
    //创建跟帖对象(UIButton)
}

//对子控件布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //对子控件进行布局
    
}

- (void)setCar:(JMCar *)car
{
    _car= car;
    
    //设置子控件的数据
}

@end
