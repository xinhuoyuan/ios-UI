//
//  ViewController.m
//  购物车(KVO)
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMWine.h"
#import "MJExtension.h"
#import "JMWineCell.h"

@interface ViewController ()<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tbView;
@property (weak, nonatomic) IBOutlet UIButton *buyBtn;
@property (weak, nonatomic) IBOutlet UILabel *allContLabel;
/**
 *  数据模型
 */
@property (nonatomic,strong)NSArray *wineArray;
/**
 *  购物车数组
 */
@property (nonatomic,strong)NSMutableArray *shopArray;
@end

@implementation ViewController

- (NSArray *)wineArray
{
    if (_wineArray == nil) {
        
        //使用框架
//        _wineArray = [JMWine mj_objectArrayWithFilename:@"wine.plist"];
        //不使用框架
        _wineArray = [JMWine wineAry];
        for (JMWine *wine in _wineArray) {
            [wine addObserver:self forKeyPath:@"count" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        }
    }
    return _wineArray;
}

#pragma mark - kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(JMWine *)wine change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    int new = [change[NSKeyValueChangeNewKey] intValue];
    
    int old = [change[NSKeyValueChangeOldKey] intValue];
    
    if (new > old) {
        //计算总价
        int counnum = self.allContLabel.text.intValue + wine.money.intValue;
        //设置总价
        self.allContLabel.text = [NSString stringWithFormat:@"%d",counnum];
        //购买按钮一定能店家
        self.buyBtn.enabled = YES;
        if (![self.shopArray containsObject:wine]) {
            [self.shopArray addObject:wine];
        }
    }else
    {
        //计算总价
        int counnum = self.allContLabel.text.intValue -  wine.money.intValue;
        //设置总价
        self.allContLabel.text = [NSString stringWithFormat:@"%d",counnum];
        //购买按钮一定能店家
        self.buyBtn.enabled = (counnum != 0);
        
        if (wine.count == 0) {
            [self.shopArray removeObject:wine];
        }

    }
}

- (void)dealloc
{
    for (JMWine *wine in self.wineArray) {
        [wine removeObserver:self forKeyPath:@"count"];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加通知
//    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//    [center addObserver:self selector:@selector(plusBtnNSNotification:) name:@"plusBtnNSNotification" object:nil];
//    [center addObserver:self selector:@selector(miusBtnNSNotification:) name:@"miusBtnNSNotification" object:nil];
    
    self.buyBtn.enabled = (self.allContLabel.text.intValue > 0);
}

//- (void)dealloc
//{
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
//}

- (NSMutableArray *)shopArray
{
    if (_shopArray == nil) {
        
        _shopArray = [NSMutableArray array];
        
    }
    return _shopArray;
}

//- (void)plusBtnNSNotification:(NSNotification *)note
//{
//    JMWineCell *cell = note.object;
//    
//    int count = self.allContLabel.text.intValue + cell.wine.money.intValue;
//    
//    self.allContLabel.text = [NSString stringWithFormat:@"%d",count];
//    
//    self.buyBtn.enabled = YES;
//    
//    if (![self.shopArray containsObject:cell.wine]) {
//        [self.shopArray addObject:cell.wine];
//    }
//}
//
//- (void)miusBtnNSNotification:(NSNotification *)note
//{
//    JMWineCell *cell = note.object;
//    
//    int count = self.allContLabel.text.intValue - cell.wine.money.intValue;
//    
//    self.allContLabel.text = [NSString stringWithFormat:@"%d",count];
//    
//    self.buyBtn.enabled = (count != 0);
//    
//    if (cell.wine.count == 0) {
//        [self.shopArray removeObject:cell.wine];
//    }
//}

//- (void)JMWineCellMiusBtnWithCell:(JMWineCell *)cell
//{
//    
//    int count = self.allContLabel.text.intValue - cell.wine.money.intValue;
//
//    self.allContLabel.text = [NSString stringWithFormat:@"%d",count];
//
//    self.buyBtn.enabled = (count != 0);
//
//    if (cell.wine.count == 0) {
//        [self.shopArray removeObject:cell.wine];
//    }
//}
//
//- (void)JMWineCellPlusBtnWithCell:(JMWineCell *)cell
//{
//    int count = self.allContLabel.text.intValue + cell.wine.money.intValue;
//    
//    self.allContLabel.text = [NSString stringWithFormat:@"%d",count];
//    
//    self.buyBtn.enabled = YES;
//    
//    if (![self.shopArray containsObject:cell.wine]) {
//        [self.shopArray addObject:cell.wine];
//    }
//    
//    
//}

#pragma mark - 按钮的点击
- (IBAction)buy {
    for (JMWine *w in self.shopArray) {
        NSLog(@"买了%d瓶%@",w.count,w.name);
    }
}
- (IBAction)clear {
    
    for (JMWine *wine in self.shopArray) {
        wine.count = 0;
    }
    
    [self.tbView reloadData];
    
    self.allContLabel.text = @"0";
    
    self.buyBtn.enabled = NO;
    
    
}



#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wineArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"wine";
    
    JMWineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.wine = self.wineArray[indexPath.row];
//    cell.delegate = self;
    
    return cell;
}
@end
