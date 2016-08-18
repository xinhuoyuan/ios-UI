//
//  JMShopView.h
//  综合练习
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JMShop;

@interface JMShopView : UIView
//商品模型
@property (nonatomic,strong)JMShop *shop;

//构造方法
- (instancetype)initWithShop:(JMShop *)shop;
+ (instancetype)shopViewWithShop:(JMShop *)shop;

@end
