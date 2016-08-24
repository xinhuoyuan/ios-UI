//
//  JMCarGroup.h
//  展示汽车数据(使用模型优化)
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMCarGroup : NSObject

/**
 *  头部
 */
@property (nonatomic ,copy)NSString *header;

/**
 *  尾部
 */
@property (nonatomic ,copy)NSString *footer;
/**
 *  所有的che
 */
@property (nonatomic,strong)NSArray *cars;

@end
