//
//  JMFlags.m
//  拦截用户输入
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMFlags.h"

@implementation JMFlags

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)flagsWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

+ (NSMutableArray *)flagsItem
{
    NSMutableArray *arrayM = [NSMutableArray array];
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"flags.plist" ofType:nil]];
    for (NSDictionary *dict in array) {
        JMFlags *flg = [JMFlags flagsWithDict:dict];
        [arrayM addObject:flg];
    }
    return arrayM;
}

@end
