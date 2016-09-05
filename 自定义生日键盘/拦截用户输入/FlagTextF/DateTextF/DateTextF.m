
//
//  DateTextF.m
//  拦截用户输入
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "DateTextF.h"

@implementation DateTextF

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

- (void)setUp
{
    UIDatePicker *datePk = [[UIDatePicker alloc]init];
    //修改datePick日期样式
    datePk.datePickerMode = UIDatePickerModeDate;
    datePk.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    //监听日期改变
    [datePk addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    self.inputView = datePk;
}

//当日期发生改变的时候会调用
- (void)dateChange:(UIDatePicker *)datePk
{
    //把当前的日期给文本框赋值
    //获取当前选中的日期
    NSDateFormatter *fat = [[NSDateFormatter alloc]init];
    fat.dateFormat = @"yyyy-MM-dd";
    //把当前日期转成字符串
    self.text = [fat stringFromDate:datePk.date];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
