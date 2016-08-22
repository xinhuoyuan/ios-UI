//
//  ViewController.m
//  模拟通知
//
//  Created by apple on 16/8/22.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMCompany.h"
#import "JMPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    JMCompany *com1 = [[JMCompany alloc]init];
    com1.name = @"Tencent";
    
    JMCompany *com2 = [[JMCompany alloc]init];
    com2.name = @"Sina";
    
    JMPerson *p1 =[[JMPerson alloc]init];
    p1.name = @"张三";
    JMPerson *p2 = [[JMPerson alloc]init];
    p2.name = @"李四";
    
    /**
     *
     *模拟通知
     */
    //监听通知
    [[NSNotificationCenter defaultCenter]addObserver:p1 selector:@selector(getNew:) name:nil object:nil];
    //发布通知
//    NSNotification *note = [NSNotification notificationWithName:@"军事新闻" object:com1 userInfo:@{@"title":@"XXXXXX"}];
//    [[NSNotificationCenter defaultCenter]postNotification:note];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"军事新闻" object:com2 userInfo:@{@"title":@"XXXXXYYUYY"}];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"娱乐新闻" object:com1 userInfo:@{@"title":@"JSHDHD"}];
    
    //匿名通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"军事新闻" object:nil userInfo:@{@"title":@"SNMASNDMSNA"}];
    
    //移除通知
//    [[NSNotificationCenter defaultCenter]removeObserver:p1 name:@"军事新闻" object:com1];
    [[NSNotificationCenter defaultCenter]removeObserver:p1];
    
    /**
     *  系统适配
     *
     *  UIDevice
     */
//    double version = [UIDevice currentDevice].systemVersion.doubleValue;
//    
//    if (version >= 9.0) {
//        
//    }else if (version >= 8.0){
//    
//    }else
//    {
//        
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
