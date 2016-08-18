//
//  ViewController.m
//  KVO的使用
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//


//KVO: Key Value Observing (键值监听) -->当某个对象的属性值发生改变的时候（用KVO监听）

#import "ViewController.h"
#import "JMPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    JMPerson *person = [[JMPerson alloc]init];
    person.name = @"zxc";
    /*
     作用：给对象绑定一个监听器（观察者）
     -Observer 观察者
     -KeyPath 要监听的属性
     -options 选项(方法中拿到属性值)
     */
    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    person.name = @"ls";
    
    person.name = @"asd";
    
    //移除监听
    [person removeObserver:self forKeyPath:@"name"];
    
}
/**
 *  当坚挺的属性值发生改变
 *
 *  @param keyPath 要改变的属性
 *  @param object  要改变的属性所属的对象
 *  @param change  改变的内容
 *  @param context 上下文
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"%@ - %@ - %@",keyPath,object,change);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
