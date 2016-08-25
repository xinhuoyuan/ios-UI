//
//  ViewController.m
//  自定义等高的cell-xib
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMTgs.h"
#import "JMTgsCell.h"

@interface ViewController ()
@property (nonatomic,strong)NSArray *tgsArrays;
@end

@implementation ViewController

- (NSArray *)tgsArrays
{
    if (_tgsArrays == nil) {
        _tgsArrays = [JMTgs tgsArray];
    }
    return _tgsArrays;
}
NSString *ID = @"tg";
- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.rowHeight = 70;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JMTgsCell class]) bundle:nil] forCellReuseIdentifier:ID];
    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgsArrays.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //访问缓存池
    JMTgsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
//    if (cell == nil) {
//        cell = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([JMTgsCell class]) owner:nil options:nil]lastObject];
//    }
    
    cell.tgs = self.tgsArrays[indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
