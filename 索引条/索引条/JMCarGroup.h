//
//  JMCarGroup.h
//  索引条
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMCarGroup : NSObject
@property (nonatomic,strong)NSArray *cars;
@property (nonatomic ,copy)NSString *title;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)carGroupWithDict:(NSDictionary *)dict;
+ (NSMutableArray *)carGroupArray;
@end
