//
//  JMPageView.h
//  图片轮播器(包装)
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMPageView : UIView

@property (nonatomic,strong)NSArray *imageNames;

+ (instancetype)pageView;

@end
