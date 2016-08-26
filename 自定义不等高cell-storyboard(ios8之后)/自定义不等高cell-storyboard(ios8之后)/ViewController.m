//
//  ViewController.m
//  自定义不等高cell-storyboard(ios8之后)
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMStatuses.h"
#import "JMStatusesCell.h"


@interface ViewController ()
@property (nonatomic,strong)NSArray *statuses;
@end

@implementation ViewController

- (NSArray *)statuses
{
    if (_statuses == nil) {
        NSArray * ary = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil]];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in ary) {
            JMStatuses *sta = [JMStatuses statusesWithDict:dict];
            [arrayM addObject:sta];
        }
        _statuses = arrayM;
    }
    return _statuses;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //self-sizing(ios8以后)
    //告诉tableView所有cell的真实高度是自动计算的(根据设置的约束)
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    //设置估算高度
    self.tableView.estimatedRowHeight = 40;
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"statuses";
    //访问缓存池
    JMStatusesCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.statuses = self.statuses[indexPath.row];
    return cell;
}

@end
