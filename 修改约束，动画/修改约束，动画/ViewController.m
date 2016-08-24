//
//  ViewController.m
//  修改约束，动画
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *reView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *reViewH;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.reViewH.constant = 50;
    [UIView animateWithDuration:2.0 animations:^{
        //强制刷新
        [self.view layoutIfNeeded];
    }];
}

@end
