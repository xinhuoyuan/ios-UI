//
//  JMShopView.m
//  综合练习
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMShop.h"

@implementation JMShop
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
    }
    return self;
}

+ (instancetype)shopViewWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
