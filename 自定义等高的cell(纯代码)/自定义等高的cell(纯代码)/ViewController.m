//
//  ViewController.m
//  自定义等高的cell(纯代码)
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMTg.h"
#import "JMTgCell.h"

@interface ViewController ()
/**
 *  所有的团购数据
 */
@property (nonatomic,strong)NSArray *tgsArray;
@end

@implementation ViewController

- (NSArray *)tgsArray
{
    if (_tgsArray == nil) {
        _tgsArray = [JMTg tgArray];
    }
    return _tgsArray;
}

NSString *ID = @"tg";
- (void)viewDidLoad {
    [super viewDidLoad];

    //根据ID注册 对应的cell类型，为tgCell
    [self.tableView registerClass:[JMTgCell class] forCellReuseIdentifier:ID];
    self.tableView.rowHeight = 70;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden{
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
    JMTgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    //设置数据(传递模型)
    cell.tg = self.tgsArray[indexPath.row];
    
    return cell;
}

@end

