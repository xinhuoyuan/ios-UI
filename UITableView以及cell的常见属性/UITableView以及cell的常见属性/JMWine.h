//
//  JMWine.h
//  UITableView以及cell的常见属性
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMWine : NSObject
/**
 *  商品图片
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

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)wineWithDict:(NSDictionary *)dict;

+ (NSMutableArray *)wineArray;

@end
