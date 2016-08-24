//
//  JMCarGroup.m
//  展示汽车数据(复杂的plist解析)
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMCarGroup.h"
#import "JMCar.h"

@implementation JMCarGroup
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.header = dict[@"header"];
        self.footer = dict[@"footer"];
        NSArray *ary = dict[@"cars"];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in ary) {
            JMCar *car = [JMCar carWithDict:dict];
            [arrayM addObject:car];
        }
        self.cars = arrayM;
    }
    return self;
}

+ (instancetype)cargroupWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
