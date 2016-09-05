
//
//  JMCityItem.m
//  拦截用户输入
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMCityItem.h"

@implementation JMCityItem
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)cityWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}


+ (NSMutableArray *)cityItem
{
    NSArray *ary = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"provinces.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in ary) {
        JMCityItem *item = [JMCityItem cityWithDict:dict];
        [arrayM addObject:item];
    }
    return arrayM;
}
@end
