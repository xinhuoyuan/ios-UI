//
//  JMWine.h
//  购物车(KVO)
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMWine : NSObject

/**
 *   商品图片
 */
@property (nonatomic ,copy)NSString *image;

/**
 *  商品价格
 */
@property (nonatomic ,copy)NSString *money;

/**
 *  商品名称
 */
@property (nonatomic ,copy)NSString *name;
/**
 *  商品总数
 *
 */
@property (nonatomic,assign)int count;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)wintWithDict:(NSDictionary *)dict;

+ (NSMutableArray *)wineAry;

@end
