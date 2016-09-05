//
//  FlagTextF.m
//  拦截用户输入
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "FlagTextF.h"
#import "JMFlags.h"
#import "JMFlagView.h"

@interface FlagTextF()<UIPickerViewDataSource,UIPickerViewDelegate>

//加载数据
@property (nonatomic,strong)NSArray *dataArray;

@property (weak, nonatomic) UIPickerView *pkView;
@end

@implementation FlagTextF

- (NSArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [JMFlags flagsItem];
    }
    return _dataArray;
}

- (void)awakeFromNib
{
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

//初始化文本
- (void)setUp
{
    //创建UIPickView
    UIPickerView *pkView = [[UIPickerView alloc]init];
    pkView.delegate = self;
    pkView.dataSource = self;
    //修改文本框弹出键盘类型
    self.inputView = pkView;
    self.pkView = pkView;
}

//实现协议方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.dataArray.count;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    JMFlagView *flagView = [JMFlagView flagView];
    //取出当前的模型
    JMFlags *flg = self.dataArray[row];
    flagView.flags = flg;
    return flagView;
}

//返回pickerView的行高
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 80;
}

//把当前选中的内容显示到文本框
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    JMFlags *item = self.dataArray[row];
    self.text = item.name;
}

- (void)initWithText
{
    [self pickerView:self.pkView didSelectRow:0 inComponent:0];
}
@end
