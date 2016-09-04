//
//  JMFlags.m
//  拦截用户输入
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMFlags.h"

@implementation JMFlags

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        //setValuesForKeysWithDictionary实现原理
//        JMFlags *item = [[JMFlags alloc]init];
//        [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//            [item setValue:obj forKey:key];
//            NSLog(@"%@--%@",key,obj);
//        }];
        /**
         [item setValue:@"中国" forKey:@"name"];
         setValue:forKeyPath实现原理
         1.先查看有没有对应key值的set方法，如果有set方法，就会调用set方法,给对应的属性赋值
         2.如果没有set方法，去查看有没有根key值相同并且带有下划线的成员属性，如果有的话，就给带下划线的成员属性赋值
         3.如果没有根key值相同并且带有下划线的成员属性，会去找有没有根key值相同名称的成员属性，如果有，就给它赋值
         4.如果没有直接报错
         */
        
    }
    return self;
}

+ (instancetype)flagsWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

- (void)setIcon:(UIImage *)icon
{
    NSString *name = (NSString *)icon;
    _icon = [UIImage imageNamed:name];
}

+ (NSMutableArray *)flagsItem
{
    NSMutableArray *arrayM = [NSMutableArray array];
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"flags.plist" ofType:nil]];
    for (NSDictionary *dict in array) {
        JMFlags *flg = [JMFlags flagsWithDict:dict];
        [arrayM addObject:flg];
    }
    return arrayM;
}

@end
