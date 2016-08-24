//
//  JMWine.m
//  UITableView以及cell的常见属性
//
//  Created by apple on 16/8/25.
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

+ (NSMutableArray *)wineArray
{
    NSArray *ary = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"wine.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in ary) {
        JMWine *wine = [self wineWithDict:dict];
        [arrayM addObject:wine];
    }
    return arrayM;
}
@end
