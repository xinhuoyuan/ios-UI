//
//  JMViewController.m
//  loadView方法(掌握)
//
//  Created by apple on 16/9/2.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMViewController.h"

@interface JMViewController ()

@end

@implementation JMViewController

//loadView作用，用来创建控制器的View
//什么时候调用：当控制器的View,第一次使用的时候调用

//loadView底层原理:
//1.先判断当前控制器是不是从storyBoard当中加载的，如果是从storyBoard加载的控制器，那么它就会把storyBoard当中加载的控制器的View，设置成当前控制器的View
//2.当前控制器是不是从Xib当中加载的，如果是从Xib当中加载的话，把xib当中指定的view，设置为当前控制器的View
//3.如果也不是从xib加载的，它会创建空白的view

//一旦重写了loadView方法，就说明要自己定义View
//- (void)loadView
//{
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
