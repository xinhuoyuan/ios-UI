//
//  JMCar.h
//  展示汽车数据(复杂的plist解析)
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMCar : NSObject
@property (nonatomic ,copy)NSString *name;
@property (nonatomic ,copy)NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)carWithDict:(NSDictionary *)dict;
@end
