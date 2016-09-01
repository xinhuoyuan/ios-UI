//
//  ViewController.m
//  UIApplication单例(了解)
//
//  Created by apple on 16/9/1.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

/*
 什么是UIApplication?
 UIApplication对象是应用程序的象征
 每一个应用都有自己的UIApplication对象这个对象是系统自动帮我们创建的，它是一个单例对性爱那个
 一个IOS程序启动后创建的第一个对象就是UIApplication对象
 我们只能通过[UIApplication sharedApplication]获得这个单例对象，不能够手动去创建它
 
 UIApplication作用?
 利用UIApplication对象，能进行一些应用级别的操作
 1.可以设置应用程序图标右上角的红色提醒数字
 2.设置联网指示器的可见性
 3.可以设置应用程序的状态栏
 4.进行应用之间的跳转
 
 模仿UIApplication单例
 要求：程序一启动就创建对象
      创建的对象只能通过share的方式获取对象。
      不能够进行alloc 操作，当执行alloc时，程序发生崩溃
 */

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIApplication *app = [UIApplication sharedApplication];
//    UIApplication *app1 = [UIApplication sharedApplication];
//    NSLog(@"%p --- %p",app,app1);
//    UIApplication *app2 = [[UIApplication alloc]init];
    
//    Person *p1 = [Person sharedPerson];
//    Person *p2 = [Person sharedPerson];
//    NSLog(@"%p ----  %p",p1,p2);
    Person *p3 = [[Person alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
