//
//  JMWine.m
//  购物车
//
//  Created by apple on 16/8/22.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMWine.h"


@implementation JMWine

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)wineWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

@end
