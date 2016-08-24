//
//  ViewController.m
//  展示单租数据
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMWine.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tbView;
/**
 *  所有的酒数据
 */
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
    // Do any additional setup after loading the view, typically from a nib.
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
//如果不实现，默认是1组
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wineArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //取出indexPath 对应的酒模型
    JMWine *wine = self.wineArray[indexPath.row];
    //设置数据
    cell.textLabel.text = wine.name;
    
    cell.detailTextLabel.text = wine.money;
    
    cell.imageView.image = [UIImage imageNamed:wine.image];
    
    return cell;
}

@end
