//
//  JMCar.h
//  Xib的基本使用
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMCar : NSObject
/**
 *  图片
 */
@property (nonatomic ,copy)NSString *image;
/**
 *  标题
 */
@property (nonatomic ,copy)NSString *title;
/**
 *  子标题
 */
@property (nonatomic ,copy)NSString *subTitle;
/**
 *  跟帖
 */
@property (nonatomic ,copy)NSString *follow;

//提供快速构造方法

@end
