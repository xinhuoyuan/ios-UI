//
//  JMCarGroup.m
//  索引条
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMCarGroup.h"
#import "JMCar.h"

@implementation JMCarGroup
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.title = dict[@"title"];
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

+ (instancetype)carGroupWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
+ (NSMutableArray *)carGroupArray
{
    NSArray *ary = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"cars.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in ary) {
        JMCarGroup *cg = [self carGroupWithDict:dict];
        [arrayM addObject:cg];
    }
    return arrayM;
}

@end
