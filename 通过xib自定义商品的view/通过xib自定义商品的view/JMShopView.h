//
//  JMShopView.h
//  通过xib自定义商品的view
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMShopView : UIView

//提供set方法
- (void)setIcon:(NSString *)icon;
- (void)setName:(NSString *)name;

//提供快速创建方法
+ (instancetype)shopView;

@end
