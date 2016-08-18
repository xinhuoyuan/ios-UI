//
//  JMdeShopView.h
//  综合练习
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JMShop;

@interface JMdeShopView : UIView
//数据模型
@property (nonatomic,strong)JMShop *shop;

//快速构造方法
+ (instancetype)shopView;
@end
