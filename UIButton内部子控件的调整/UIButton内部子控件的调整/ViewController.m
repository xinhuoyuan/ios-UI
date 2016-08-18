//
//  ViewController.m
//  UIButton内部子控件的调整
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.1创建按钮
    JMButton *button = [JMButton buttonWithType:UIButtonTypeCustom];
    
    //1.2设置frame
    button.frame = CGRectMake(100, 100, 170, 70);
    
    //1.3设置背景颜色
    button.backgroundColor = [UIColor purpleColor];
    
    //1.4设置文字
    [button setTitle:@"普通按钮" forState:UIControlStateNormal];
    
    //1.5设置内容图片
    [button setImage:[UIImage imageNamed:@"miniplayer_btn_playlist_normal"] forState:UIControlStateNormal];
    
    //1.6改变位置
    button.imageView.backgroundColor = [UIColor yellowColor];
    button.titleLabel.backgroundColor = [UIColor blueColor];
    //注意：在按钮外面改的尺寸，按钮的内部都会覆盖掉
//    button.titleLabel.frame = CGRectMake(0, 0, 100, 70);
//    button.imageView.frame = CGRectMake(100, 0, 70, 70);
    [button titleRectForContentRect:CGRectMake(0, 0, 100, 70)];
    [button imageRectForContentRect:CGRectMake(100, 0, 70, 70)];
    
    [self.view addSubview:button];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
