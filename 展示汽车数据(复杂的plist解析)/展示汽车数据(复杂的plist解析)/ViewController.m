//
//  ViewController.m
//  展示汽车数据(复杂的plist解析)
//
//  Created by apple on 16/8/24.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMCar.h"
#import "JMCarGroup.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tbView;


/** 所有的车数据*/
@property (nonatomic,strong)NSArray *carGroups;
@end

@implementation ViewController

/***************************
 1>plist解析
 以后遇到这样复杂plist,一层一层的往下解析。
 最终的目的就是将所有的字典转成模型。
 如果plist中字典在一个数组中，将来转出来的模型也放在一个数组中
 也就是字典数组转成模型数组。
 2>plist的好处:方便管理数据
 ***************************/


//plist
-(NSArray *)carGroups
{
    if (_carGroups == nil) {
        //1.加载字典数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"cars.plist" ofType:nil]];
        //2.创建模型数组
        NSMutableArray *temp = [NSMutableArray array];
        //3.字典数组 -> 模型数组
        for (NSDictionary *GroupDict in dictArray) {
            JMCarGroup *group = [JMCarGroup cargroupWithDict:GroupDict];
            [temp addObject:group];
        }
        _carGroups = temp;
    }
    return _carGroups;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //取出第section组的组模型
    JMCarGroup *group = self.carGroups[section];
    return group.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    //色获知cell右边的指示样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //取出indexPath.section这组的组模型
    JMCarGroup *group = self.carGroups[indexPath.section];
    //取出indexPath.row对应的组模型
    JMCar *car = group.cars[indexPath.row];
    
    //设置数据
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}

//告诉tableView每一组的头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //取出section组的组模型
    JMCarGroup *group = self.carGroups[section];
    return group.header;
}

//告诉tableView每一组的尾部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    //去除section组的组模型
    JMCarGroup *group = self.carGroups[section];
    return group.footer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
