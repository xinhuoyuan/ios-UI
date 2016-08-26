//
//  ViewController.m
//  不同类型的cell共存(xib)
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMTgs.h"
#import "JMTgsCell.h"
#import "JMTestCell.h"

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
NSString *ID = @"tgs";
NSString *testID = @"test";
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.rowHeight = 70;

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JMTgsCell class]) bundle:nil] forCellReuseIdentifier:ID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([JMTestCell class]) bundle:nil] forCellReuseIdentifier:testID];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgsArrays.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2== 0) {
        
        JMTgsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        cell.tgs = self.tgsArrays[indexPath.row];
        return cell;
    }else{
        JMTestCell *cell = [tableView dequeueReusableCellWithIdentifier:testID];
        return cell;
    }
    
    
    
}

@end
