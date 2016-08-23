//
//  ViewController.m
//  购物车尝试(代理模式)
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMWine.h"
#import "MJExtension.h"
#import "JMWineCell.h"

@interface ViewController ()<UITableViewDataSource,JMWineCellDelegate>

/**
 *  数据模型
 */

@property (weak, nonatomic) IBOutlet UIButton *butBtn;
@property (weak, nonatomic) IBOutlet UILabel *allCountLabel;
@property (nonatomic,strong)NSArray *wineArray;
@property (weak, nonatomic) IBOutlet UITableView *tbView;

//购物车模型
@property (nonatomic,strong)NSMutableArray *shopAry;
@end

@implementation ViewController

- (NSMutableArray *)shopAry
{
    if (_shopAry == nil) {
        _shopAry = [NSMutableArray array];
    }
    return _shopAry;
}

- (NSArray *)wineArray
{
    if (_wineArray == nil) {
        _wineArray = [JMWine mj_objectArrayWithFilename:@"wine.plist"];
    }
    return _wineArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSNotificationCenter *denter = [NSNotificationCenter defaultCenter];
//    [denter addObserver:self selector:@selector(plusBtnClickNSNotification:) name:@"plusBtnClickNSNotification" object:nil];
//    [denter addObserver:self selector:@selector(miusBtnClickNSNotification:) name:@"miusBtnClickNSNotification" object:nil];
}

//- (void)dealloc
//{
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
//}

//- (void)plusBtnClickNSNotification:(NSNotification *)note
//{
//    JMWineCell *cell = note.object;
//    
//    int countnum = self.allCountLabel.text.intValue + cell.wine.money.intValue;
//    
//    self.allCountLabel.text = [NSString stringWithFormat:@"%d",countnum];
//    
//    if (![self.shopAry containsObject:cell.wine]) {
//        [self.shopAry addObject:cell.wine];
//    }
//    self.butBtn.enabled = YES;
//}
//
//- (void)miusBtnClickNSNotification:(NSNotification *)note
//{
//    JMWineCell *cell = note.object;
//    
//    int countnum = self.allCountLabel.text.intValue + cell.wine.money.intValue;
//    
//    self.allCountLabel.text = [NSString stringWithFormat:@"%d",countnum];
//    
//    if (cell.wine.count == 0) {
//        [self.shopAry removeObject:cell.wine];
//    }
//    
//    self.butBtn.enabled = (self.allCountLabel.text.intValue != 0);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 购买，清空购物车
- (IBAction)buy {
    for (JMWine *w in self.shopAry) {
        NSLog(@"买了%d瓶%@",w.count,w.name);
    }
}
- (IBAction)clear {
    
    for (JMWine *wi in self.shopAry) {
        wi.count = 0;
    }
    
    [self.tbView reloadData];
    
    self.allCountLabel.text = @"0";
    
    [self.shopAry removeAllObjects];
    
    self.butBtn.enabled = NO;
    
    
}

#pragma mark - JMWineCellDelegate

- (void)plusBtnClick:(JMWineCell *)cell
{
    int counnum = self.allCountLabel.text.intValue + cell.wine.money.intValue;
    
    self.allCountLabel.text = [NSString stringWithFormat:@"%d",counnum];
    
    if (![self.shopAry containsObject:cell.wine]) {
        [self.shopAry addObject:cell.wine];
    }
    
    self.butBtn.enabled = YES;
}


- (void)miusBtnClick:(JMWineCell *)cell
{
    int counNum = self.allCountLabel.text.intValue - cell.wine.money.intValue;
    
    self.allCountLabel.text = [NSString stringWithFormat:@"%d",counNum];
    
    if (cell.wine.count == 0) {
        [self.shopAry removeObject:cell.wine];
    }
    
    self.butBtn.enabled = (counNum != 0);
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.wineArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"wine";
    JMWineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.wine = self.wineArray[indexPath.row];
    cell.delegate = self;
    return cell;
}

@end
