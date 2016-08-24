//
//  JMCar.m
//  展示汽车数据(使用模型优化)
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMCar.h"

@implementation JMCar

+ (instancetype)carWithName:(NSString *)name icon:(NSString *)icon
{
    JMCar *car= [[JMCar alloc]init];
    car.name = name;
    car.icon = icon;
    return car;
}

@end
