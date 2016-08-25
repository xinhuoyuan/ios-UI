//
//  ViewController.m
//  性能优化(注册的方式)
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSString *ID = @"wine";
- (void)viewDidLoad {
    [super viewDidLoad];

    //设置table每一行cell的高度
    self.tableView.rowHeight = 100;
    
    //根据ID 这个表示注册对应的cell类型为UITableViewCell(只注册一次)
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 200;
}

/**
 *  每当一个cell进入视野范围就会调用一次
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.去缓存池中取是否有可循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    //2.设置数据
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行数据",indexPath.row];
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
