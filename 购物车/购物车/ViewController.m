//
//  ViewController.m
//  购物车
//
//  Created by apple on 16/8/22.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMWineCell.h"
#import "MJExtension.h"
#import "JMWine.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tbView;

@property (weak, nonatomic) IBOutlet UIButton *buyBtn;
@property (weak, nonatomic) IBOutlet UILabel *allCountLabel;
//数据模型
@property (nonatomic,strong)NSMutableArray *wineArray;

/**
 *  购物车对象
 */
@property (nonatomic,strong)NSMutableArray *shopCarArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //监听通知
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(plusClick:) name:@"plusClickNSNotification" object:nil];
    [center addObserver:self selector:@selector(miusClick:) name:@"miusClickNSNotification" object:nil];
}

//购物车对象
- (NSMutableArray *)shopCarArray
{
    if (_shopCarArray == nil) {
        _shopCarArray = [NSMutableArray array];
    }
    return _shopCarArray;
}

//移除通知

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)plusClick:(NSNotification *)note
{
    //发布者
    JMWineCell *cell = note.object;
    
    //计算总价
    int totalPrice = self.allCountLabel.text.intValue + cell.wine.money.intValue;
    
    //设置总价
    self.allCountLabel.text = [NSString stringWithFormat:@"%d",totalPrice];
    
    //购买按钮一定能点击
    self.buyBtn.enabled = YES;
    
    //之前没有添加过，才添加
    if (![self.shopCarArray containsObject:cell.wine]) {
        [self.shopCarArray addObject:cell.wine];
    }
    
    
}

- (void)miusClick:(NSNotification *)note
{
    //发布者
    JMWineCell *cell = note.object;
    
    //计算总价
    int totalPrice = self.allCountLabel.text.intValue - cell.wine.money.intValue;
    
    //设置总价
    self.allCountLabel.text = [NSString stringWithFormat:@"%d",totalPrice];
    
    self.buyBtn.enabled = (self.allCountLabel.text.intValue > 0);
    
    //移除不需要再买的酒
    if (cell.wine.count == 0) {
        [self.shopCarArray removeObject:cell.wine];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)wineArray
{
    if (_wineArray == nil) {
        NSArray *ary = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"wine.plist" ofType:nil]];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in ary) {
            JMWine *wine = [JMWine wineWithDict:dict];
            [arrayM addObject:wine];
        }
        _wineArray = arrayM;
    }
    return _wineArray;
}

#pragma mark - 清空购物车 购买按钮
- (IBAction)Clear {
    //总价清零
    self.allCountLabel.text = @"0";
    
    //修改模型
    for (JMWine *wi in self.wineArray) {
        wi.count = 0;
    }
    
    //刷新表格
    [self.tbView reloadData];
    
    //清空购物车
    [self.shopCarArray removeAllObjects];
    
    //购买按钮不能点击
    self.buyBtn.enabled = NO;
}
- (IBAction)buy {
    
    //打印多少瓶酒
//    for (JMWine *w in self.wineArray) {
//        if (w.count) {
//            NSLog(@"购买了%d瓶%@",w.count,w.name);
//        }
//    }
    for (JMWine *wine in self.shopCarArray) {
        NSLog(@"购买了%d瓶%@",wine.count,wine.name);
    }
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wineArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"wine";
    JMWineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.wine = self.wineArray[indexPath.row];
    
    return cell;
}

@end
