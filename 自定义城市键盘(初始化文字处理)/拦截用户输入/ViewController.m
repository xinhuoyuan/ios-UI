//
//  ViewController.m
//  拦截用户输入
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+Extension.h"
#import "FlagTextF.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *countryTextF;
@property (weak, nonatomic) IBOutlet UITextField *birthDatTextF;
@property (weak, nonatomic) IBOutlet UITextField *cityTextF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.countryTextF.delegate = self;
    self.birthDatTextF.delegate = self;
    self.cityTextF.delegate = self;
}

//是否允许开始编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}
//开始编辑时调用(成为第一响应者)
- (void)textFieldDidBeginEditing:(FlagTextF *)textField
{
    //让当前编辑的文本选中第一个
    //在运行时，会去找它真实类型的方法
    [textField initWithText];
}
//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    //让当前编辑的文本选中第一个
//    //在运行时，会去找它真实类型的方法
//    [textField initWithText];
//}
//是否允许结束编辑
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}
//当结束编辑时调用
- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"%s",__func__);
}
//是否允许改变文本框内容(拦截用户输入)
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
