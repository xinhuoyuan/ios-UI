//
//  JMCar.h
//  展示汽车数据(使用模型优化)
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMCar : NSObject
/**
 *  名称
 */
@property (nonatomic ,copy)NSString *name;

/**
 *  图标
 */
@property (nonatomic ,copy)NSString *icon;
+ (instancetype)carWithName:(NSString *)name icon:(NSString *)icon;

@end
