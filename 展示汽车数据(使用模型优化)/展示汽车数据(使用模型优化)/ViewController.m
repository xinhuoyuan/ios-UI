//
//  ViewController.m
//  展示汽车数据(使用模型优化)
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMCar.h"
#import "JMCarGroup.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tbView;

/****显示所有车数据*****/
@property (nonatomic,strong)NSArray *carGroup;
@end

@implementation ViewController

- (NSArray *)carGroup
{
    if (_carGroup == nil) {
        JMCarGroup *group0= [[JMCarGroup alloc]init];
        group0.header = @"德系品牌";
        group0.footer = @"德系品牌JKJKJK";
        group0.cars = @[
                        [JMCar carWithName:@"奔驰" icon:@"m_2_100"],
                        [JMCar carWithName:@"宝马" icon:@"m_3_100"]
                        ];
        JMCarGroup *group1 = [[JMCarGroup alloc]init];
        group1.header = @"日系品牌";
        group1.footer = @"日系品牌JKJKJKJK";
        group1.cars = @[
                        [JMCar carWithName:@"丰田" icon:@"m_7_100"],
                        [JMCar carWithName:@"马自达" icon:@"m_18_100"],
                        [JMCar carWithName:@"本田" icon:@"m_26_100"]
                        ];
        JMCarGroup *group2 = [[JMCarGroup alloc]init];
        group2.header = @"天系品牌";
        group2.footer = @"天系品牌JKJK";
        group2.cars = @[
                        [JMCar carWithName:@"比亚的" icon:@"m_15_100"]
                        ];
        _carGroup = @[group0,group1,group2];
    }
    return _carGroup;
}
#pragma mark -UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroup.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //取出section组的组模型
    JMCarGroup *group =self.carGroup[section];
    return group.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    //设置cell右边的指示样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //去除indexPath.section这组的组模型
    JMCarGroup *group = self.carGroup[indexPath.section];
    //取出indexPath.row对应的车模型
    JMCar *car = group.cars[indexPath.row];
    //设置数据
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //取出section组的组模型
    JMCarGroup *group = self.carGroup[section];
    return group.header;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    //取出第section组的组模型
    JMCarGroup *group = self.carGroup[section];
    return group.footer;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
