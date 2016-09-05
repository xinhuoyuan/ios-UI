
//
//  CityTextF.m
//  拦截用户输入
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "CityTextF.h"
#import "JMCityItem.h"

@interface CityTextF()<UIPickerViewDataSource,UIPickerViewDelegate>

/**
 *  存放的都是省份模型
 */
@property (nonatomic,strong)NSArray *dateArray;

@end

@implementation CityTextF

- (NSArray *)dateArray
{
    if (_dateArray == nil) {
        _dateArray = [JMCityItem cityItem];
    }
    return _dateArray;
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

- (void)setUp
{
    //创建UIPickerView
    UIPickerView *pick = [[UIPickerView alloc]init];
    pick.delegate = self;
    pick.dataSource = self;
    //修改文本框弹出键盘类型
    self.inputView = pick;
}

//总共有多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

//每一列有多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.dateArray.count;
    }else
    {
        //当前选中的省份决定，当前选中省份下有多少城市
        //当前选中的省份模型，返回当前选中的省份下的城市数量
        JMCityItem *item = self.dateArray[[pickerView selectedRowInComponent:0]];
        return item.cities.count;
        
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        JMCityItem *item = self.dateArray[row];
        return item.name;
    }else
    {
        JMCityItem *item = self.dateArray[[pickerView selectedRowInComponent:0]];
        return item.cities[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        //第1列选中的第0行
        [pickerView selectRow:0 inComponent:1 animated:YES];
        //刷新数据
        [pickerView reloadAllComponents];
    }
    //取出当前选中的省份
    JMCityItem *item = self.dateArray[[pickerView selectedRowInComponent:0]];
    NSString *cityName1 = item.name;
    
    NSString *cityName2 = item.cities[[pickerView selectedRowInComponent:1]];
    self.text = [NSString stringWithFormat:@"%@-%@",cityName1,cityName2];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
