//
//  JMStatuses.m
//  自定义不等高cell-storyboard(ios8之后)
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

+ (instancetype)statusesWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
