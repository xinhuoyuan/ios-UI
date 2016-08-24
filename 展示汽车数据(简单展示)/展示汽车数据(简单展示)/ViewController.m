//
//  ViewController.m
//  展示汽车数据(简单展示)
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>

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


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }else
    {
        return 3;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    //设置cell右边显示的控件
    //accessoryView优先级>accessoryType
//    cell.accessoryView = [[UISwitch alloc]init];
    //设置cell有右边的样式
    
    /*
     UITableViewCellAccessoryNone,                                                      没有
     UITableViewCellAccessoryDisclosureIndicator,                                       箭头
     UITableViewCellAccessoryDetailDisclosureButton __TVOS_PROHIBITED,                 提示感叹号
     UITableViewCellAccessoryCheckmark,                                                 √
     UITableViewCellAccessoryDetailButton NS_ENUM_AVAILABLE_IOS(7_0)  __TVOS_PROHIBITED /提示感叹号
     */
    cell.accessoryType  =UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"奔驰";
            cell.imageView.image = [UIImage imageNamed:@"m_2_100"];
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"宝马";
            cell.imageView.image = [UIImage imageNamed:@"m_3_100"];
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.textLabel.text = @"丰田";
            cell.imageView.image = [UIImage imageNamed:@"m_7_100"];
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"马自达";
            cell.imageView.image = [UIImage imageNamed:@"m_18_100"];
        }else if (indexPath.row == 2){
            cell.textLabel.text = @"本田";
            cell.imageView.image = [UIImage imageNamed:@"m_26_100"];
        }
        
    }
    return cell;
}

//告诉tableView每一组的头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"德系品牌";
    }else
    {
        return @"日系品牌";
    }
}

//告诉tableView每一组的尾部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return @"德系品牌GHGHGGHG";
    }else
    {
        return @"日系品牌HJHJHJHJ";
    }
}
@end
