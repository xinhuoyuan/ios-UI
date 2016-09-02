//
//  JMViewController.m
//  控制器View的颜色
//
//  Created by apple on 16/9/2.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMViewController.h"

@interface JMViewController ()

@end

@implementation JMViewController


//当控制器的view加载完毕的时候调用
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
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
