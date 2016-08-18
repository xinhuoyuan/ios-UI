//
//  ViewController.m
//  UIButton的内边距
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *showBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置按钮的内边距
    //1.设置内容
//    self.showBtn.contentEdgeInsets = UIEdgeInsetsMake(-20, 0, 0, 0);
    
    //2.设置图片
    self.showBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    //3.设置标题
    self.showBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -10);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
