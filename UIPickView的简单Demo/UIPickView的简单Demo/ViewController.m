//
//  ViewController.m
//  UIPickView的简单Demo
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pkView;
@property (weak, nonatomic) IBOutlet UILabel *showLabl;
//存放加载的数据
@property (nonatomic,strong)NSArray *dataArray;

@end

@implementation ViewController

- (NSArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"foods.plist" ofType:nil]];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.pkView.dataSource = self;
    self.pkView.delegate = self;
    
    [self pickerView:self.pkView didSelectRow:0 inComponent:0];
}
//展示多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.dataArray.count;
}
//每一列展示多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *array = self.dataArray[component];
    return array.count;
}

//每一行的每一列展示什么内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.dataArray[component][row];
}

//当前选中的哪一列哪一行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.showLabl.text = self.dataArray[component][row];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
