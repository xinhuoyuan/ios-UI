//
//  JMFlags.h
//  拦截用户输入
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JMFlags : NSObject

@property (nonatomic,strong)NSString *name;

@property (nonatomic,strong)NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)flagsWithDict:(NSDictionary *)dict;
+ (NSMutableArray *)flagsItem;

@end
