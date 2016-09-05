//
//  ThreeViewController.m
//  导航控制器跳转
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ThreeViewController.h"
#import "TwoViewController.h"
#import "OneViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//回到指定控制器
- (IBAction)Jump2Some {
    [self.navigationController popToViewController:self.navigationController.childViewControllers[0] animated:YES];
}
//返回上一级
- (IBAction)Jump2Up {
    [self.navigationController popViewControllerAnimated:YES];
}
//回到根控制器
- (IBAction)Jump2Root {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
