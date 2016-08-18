//
//  JMPerson.h
//  KVC的使用
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JMDog;

@interface JMPerson : NSObject

/**
 *  姓名
 */
@property (nonatomic ,copy)NSString *name;
/**
 *  钱
 */
@property (nonatomic,assign)float money;
/**
 *  狗
 */
@property (nonatomic,strong)JMDog *dog;

/**
 *  序号
 */
@property (nonatomic ,copy)NSString *no;

- (void)printAge;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)personWithDict:(NSDictionary *)dict;

@end
