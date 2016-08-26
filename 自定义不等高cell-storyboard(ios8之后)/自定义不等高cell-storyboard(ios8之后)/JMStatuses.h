//
//  JMStatuses.h
//  自定义不等高cell-storyboard(ios8之后)
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMStatuses : NSObject
@property (nonatomic ,copy)NSString *text;
@property (nonatomic ,copy)NSString *icon;
@property (nonatomic ,copy)NSString *name;
@property (nonatomic,assign,getter=isVip)BOOL vip;
@property (nonatomic ,copy)NSString *picture;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)statusesWithDict:(NSDictionary *)dict;
@end
