//
//  JMFlagView.h
//  拦截用户输入
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JMFlags;

@interface JMFlagView : UIView

+ (instancetype)flagView;

@property (nonatomic,strong)JMFlags *flags;

@end
