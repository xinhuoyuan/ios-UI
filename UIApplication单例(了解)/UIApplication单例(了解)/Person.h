//
//  Person.h
//  UIApplication单例(了解)
//
//  Created by apple on 16/9/1.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

+ (instancetype)sharedPerson;

@end
