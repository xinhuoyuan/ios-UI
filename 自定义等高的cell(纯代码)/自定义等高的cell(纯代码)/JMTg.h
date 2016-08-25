//
//  JMTg.h
//  自定义等高的cell(纯代码)
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMTg : NSObject
/**
 *  购买人数
 */
@property (nonatomic ,copy)NSString  *buyCount;
/**
 *  商品图片
 */
@property (nonatomic ,copy)NSString *icon;
/**
 *  商品价格
 */
@property (nonatomic ,copy)NSString *price;
/**
 *  商品名称
 */
@property (nonatomic ,copy)NSString *title;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)tgWithDict:(NSDictionary *)dict;
+ (NSMutableArray *)tgArray;
@end
