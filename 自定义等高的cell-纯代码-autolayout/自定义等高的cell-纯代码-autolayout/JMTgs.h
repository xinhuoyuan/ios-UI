//
//  JMTgs.h
//  自定义等高的cell-纯代码-autolayout
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMTgs : NSObject

@property (nonatomic ,copy)NSString *buyCount;

@property (nonatomic ,copy)NSString *icon;

@property (nonatomic ,copy)NSString *price;

@property (nonatomic ,copy)NSString *title;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)tgsWithDict:(NSDictionary *)dict;
+ (NSMutableArray *)tgsArray;

@end
