//
//  JMStatuses.m
//  自定义不等高的cell(ios8以前)
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMStatuses.h"

@implementation JMStatuses
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)statusesWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

+ (NSMutableArray *)statusesArray
{
    NSArray *ary = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in ary) {
        JMStatuses *sta = [self statusesWithDict:dict];
        [arrayM addObject:sta];
    }
    return arrayM;
}
@end
