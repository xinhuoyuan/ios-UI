//
//  JMCarGroup.h
//  展示汽车数据(复杂的plist解析)
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMCarGroup : NSObject
@property (nonatomic ,copy)NSString *header;
@property (nonatomic ,copy)NSString *footer;
@property (nonatomic,strong)NSArray *cars;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)cargroupWithDict:(NSDictionary *)dict;
@end
