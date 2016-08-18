//
//  ViewController.m
//  常见控件的监听
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *showText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.UIButton
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //2.UIScrollView
    UIScrollView *scrolView = nil;
    scrolView.delegate = self;
    
    //2.UISegmentedControl
    UISegmentedControl *s = [[UISegmentedControl alloc]initWithItems:@[@"2213",@"213",@"123"]];
    s.selectedSegmentIndex = 0;
    [s addTarget:self action:@selector(sClick:) forControlEvents:UIControlEventValueChanged];
    s.center = CGPointMake(self.view.center.x, 200);
    [self.view addSubview:s];
    
    //4.textField
    self.showText.delegate = self;
    
    /*
     UIControlEventEditingDidBegin
     UIControlEventEditingChanged
     UIControlEventEditingDidEnd
     */
//    [self.showText addTarget:self action:@selector(tfEditingDidBegin) forControlEvents:UIControlEventEditingDidBegin];
//    
//    [self.showText addTarget:self action:@selector(tfEditingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
//    
//    [self.showText addTarget:self action:@selector(tfEditingChanged:) forControlEvents:UIControlEventEditingChanged];
}

#pragma mark - textFlied监听方法
- (void)tfEditingDidBegin
{
    NSLog(@"开始编辑");
}

- (void)tfEditingDidEnd
{
    NSLog(@"结束编辑");
}

- (void)tfEditingChanged:(UITextField *)tf
{
    NSLog(@"%@",tf.text);
}

#pragma mark - UITextFielfDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"开始编辑");
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"结束编辑");
}

/**
 *  当textField丸子改变就会调用这个方法
 *
 *  @param string    用户输入的文字
 *
 *  @return YES:允许用户输入；NO:禁止用户输入
 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"shouldChangeCharactersInRange -- %@",string);
    if ([string isEqualToString:@"1"]) {
        return NO;
    }
    return YES;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //退出键盘
//    [self.showText endEditing:YES];
    //辞去第一响应(退出键盘)
//    [self.showText resignFirstResponder];
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)btnClick:(UIButton *)btn{
}

- (void)sClick:(UISegmentedControl *)s
{
    NSLog(@"%ld",s.selectedSegmentIndex);
}

@end
