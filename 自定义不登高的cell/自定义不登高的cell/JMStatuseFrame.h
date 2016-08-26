//
//  JMStatuseFrame.h
//  自定义不登高的cell
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class JMStatuse;

@interface JMStatuseFrame : NSObject

@property (nonatomic,strong)JMStatuse *statuse;

@property (nonatomic,assign,readonly)CGRect iconFrame;

@property (nonatomic,assign,readonly)CGRect nameFrame;

@property (nonatomic,assign,readonly)CGRect vipFrame;

@property (nonatomic,assign,readonly)CGRect textFrame;

@property (nonatomic,assign,readonly)CGRect pictureFrame;

@property (nonatomic,assign,readonly)CGFloat cellHeight;

+ (NSMutableArray *)statuessFrame;


@end
