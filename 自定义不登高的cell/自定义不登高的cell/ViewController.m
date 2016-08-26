//
//  ViewController.m
//  自定义不登高的cell
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMStatuse.h"
#import "JMStatusesCell.h"
#import "JMStatuseFrame.h"

@interface ViewController ()
@property (nonatomic,strong)NSArray *statusesArrays;
@end

@implementation ViewController

- (NSArray *)statusesArrays
{
    if (_statusesArrays == nil) {
        _statusesArrays = [JMStatuseFrame statuessFrame];
    }
    return _statusesArrays;
}
NSString *ID = @"statuses";
- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView registerClass:[JMStatusesCell class] forCellReuseIdentifier:ID];
    
    self.tableView.rowHeight = 250;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusesArrays.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JMStatusesCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.sFrame = self.statusesArrays[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JMStatuseFrame *sfa = self.statusesArrays[indexPath.row];
    return sfa.cellHeight;
}


@end
