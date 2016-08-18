//
//  JMPerson.m
//  KVC的使用
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMPerson.h"

@implementation JMPerson
{
    int _age;
}

- (instancetype)init
{
    if (self = [super init]) {
        _age = 8;
    }
    return self;
}

- (void)printAge
{
    NSLog(@"age:%d",_age);
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@ -- money:%.2f",_name,_money];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
//        self.name = dict[@"name"];
//        self.money = [dict[@"money"] floatValue];
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)personWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}


@end
