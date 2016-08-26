
//
//  JMStatuse.m
//  自定义不登高的cell
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMStatuse.h"

@implementation JMStatuse
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)statuseWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

//+ (NSMutableArray *)statuseArray
//{
//    NSArray *ary = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil]];
//    NSMutableArray *arrayM = [NSMutableArray array];
//    for (NSDictionary *dict in ary) {
//        JMStatuse *sta = [self statuseWithDict:dict];
//        [arrayM addObject:sta];
//    }
//    
//    return arrayM;
//}
@end
