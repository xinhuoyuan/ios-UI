//
//  ViewController.m
//  自定义等高的cell-storyboard
//
//  Created by apple on 16/8/26.
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

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.rowHeight = 70;
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
//    if (indexPath.row %2 == 0) {
    
        static NSString *ID = @"tg";
        
        //访问缓存池
        JMTgsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        
        //设置数据
        cell.tgs = self.tgsArrays[indexPath.row];
        
        return cell;
//    }else
//    {
//        return [tableView dequeueReusableCellWithIdentifier:@"test"];
//    }
    
}




@end
