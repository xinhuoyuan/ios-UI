//
//  JMCityItem.h
//  拦截用户输入
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMCityItem : NSObject

@property (nonatomic,strong)NSArray *cities;

@property (nonatomic,strong)NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)cityWithDict:(NSDictionary *)dict;
+ (NSMutableArray *)cityItem;

@end
