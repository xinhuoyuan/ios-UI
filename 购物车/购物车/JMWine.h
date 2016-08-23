//
//  JMWine.h
//  购物车
//
//  Created by apple on 16/8/22.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JMWine : NSObject
/**
 *  酒的图片
 */
@property (nonatomic ,copy)NSString *image;

/**
* 酒的价格
*/

@property (nonatomic ,copy)NSString *money;
/**
*  酒的名称
*/
@property (nonatomic ,copy)NSString *name;

/**
 *  购买商品的数量
 */
@property (nonatomic,assign)int count;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)wineWithDict:(NSDictionary *)dict;

@end
