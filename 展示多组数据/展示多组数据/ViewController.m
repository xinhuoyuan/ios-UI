//
//  ViewController.m
//  展示多组数据
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tbView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置数据源
    self.tbView.dataSource = self;
}

#pragma mark - UITableViewDataSource
/**
 *  告诉tableView一共有多少组数据
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

/**
 *  告诉tabelView第section组有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {//第0组
        return 2;
    }else if (section == 1){ //第1组
        return 6;
    }else if (section == 2){ //第2组
        return 6;
    }else //最后1组
    {
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    if (indexPath.section == 0) { //第0组
        if (indexPath.row == 0) { //第0组第0行
            cell.textLabel.text = @"通用";
        }else if (indexPath.row == 1){ //第0组第1行
            cell.textLabel.text = @"隐私";
        }
    }else
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%ld组%zd行-其他数据",indexPath.section,indexPath.row];
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
