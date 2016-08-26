//
//  JMTgs.m
//  不同类型的cell共存(xib)
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMTgs.h"

@implementation JMTgs
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)tgsWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}


+ (NSMutableArray *)tgsArray
{
    NSArray *ary = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"tgs.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in ary) {
        JMTgs *tg = [self tgsWithDict:dict];
        [arrayM addObject:tg];
    }
    return arrayM;
}
@end
