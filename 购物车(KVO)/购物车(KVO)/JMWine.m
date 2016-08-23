

//
//  JMWine.m
//  购物车(KVO)
//
//  Created by apple on 16/8/23.
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


+ (instancetype)wintWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

+ (NSMutableArray *)wineAry
{
    NSArray *ary = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"wine.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in ary) {
        JMWine *wine = [self wintWithDict:dict];
        [arrayM addObject:wine];
    }
    return arrayM;
}

@end
