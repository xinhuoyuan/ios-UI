//
//  ViewController.m
//  UITableView以及cell的常见属性
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMWine.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tbView;
/**所有的酒数据*/
@property (nonatomic,strong)NSArray *wineArray;
@end

@implementation ViewController

- (NSArray *)wineArray
{
    if (_wineArray == nil) {
        _wineArray = [JMWine wineArray];
    }
    return _wineArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置tableView每一行cell的高度
    self.tbView.rowHeight = 100;
    
    //设置tableView每一组的头部高度
    self.tbView.sectionHeaderHeight = 80;
    //设置tableView每一组的尾部高度
//    self.tbView.sectionFooterHeight = 80;
    
    //设置分割线的样式
//    self.tbView.separatorColor = [UIColor redColor];
    
    //设置分割显得样式
    self.tbView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //设置表头控件
    self.tbView.tableHeaderView = [[UISwitch alloc]init];
    
    //设置表尾控件
    self.tbView.tableFooterView = [[UISwitch alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wineArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    //设置右边显示的指示样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //设置右边显示的指示控件
    cell.accessoryView = [[UISwitch alloc]init];
    //设置选中样式
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //设置cell的背景view
    
    //backgroundView的优先级>backgroundColor
//    UIView *bg = [[UIView alloc]init];
//    bg.backgroundColor = [UIColor blueColor];
//    cell.backgroundColor = bg;
    
    //设置cell的背景颜色
//    cell.backgroundColor = [UIColor redColor];
    
//    //设置cell选中时候的背景view
//    UIView *selectedBg = [[UIView alloc]init];
//    selectedBg.backgroundColor = [UIColor greenColor];
//    cell.selectedBackgroundView = selectedBg;
    
    JMWine *wine = self.wineArray[indexPath.row];
    
    cell.textLabel.text = wine.name;
    
    cell.detailTextLabel.text = wine.money;
    
    cell.imageView.image = [UIImage imageNamed:wine.image];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"头部";
}

@end
