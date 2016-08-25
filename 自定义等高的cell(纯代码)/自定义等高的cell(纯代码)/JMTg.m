//
//  JMTg.m
//  自定义等高的cell(纯代码)
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMTg.h"

@implementation JMTg

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)tgWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

+(NSMutableArray *)tgArray
{
    NSArray *ary = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"tgs.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in ary) {
        JMTg *tg = [self tgWithDict:dict];
        [arrayM addObject:tg];
    }
    return arrayM;
}

@end
