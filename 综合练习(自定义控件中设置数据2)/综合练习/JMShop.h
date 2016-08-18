//
//  JMShopView.h
//  综合练习
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMShop : NSObject
//商品名称
@property (nonatomic ,copy)NSString *name;
//商品图片
@property (nonatomic ,copy)NSString *icon;

//提供构造方法
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)shopViewWithDict:(NSDictionary *)dict;

@end
