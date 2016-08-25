//
//  ViewController.m
//  自定义等高的cell-纯代码-autolayout
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMTgs.h"
#import "JMTgsCell.h"

@interface ViewController ()
@property (nonatomic,strong)NSArray *tgsArray;
@end

@implementation ViewController

NSString *ID = @"tg";
- (NSArray *)tgsArray
{
    if (_tgsArray == nil) {
        _tgsArray = [JMTgs tgsArray];
    }
    return _tgsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.rowHeight = 70;
    //根据ID 注册 对应的cell类型 为JMTgsCell
    [self.tableView registerClass:[JMTgsCell class] forCellReuseIdentifier:ID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //访问缓存池
    JMTgsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    //设置数据
    cell.tgs = self.tgsArray[indexPath.row];
    
    return cell;
}

@end
