//
//  ViewController.m
//  索引条
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMCar.h"
#import "JMCarGroup.h"
#import "MJExtension.h"

@interface ViewController ()

/**
 *  所有的车数据
 */
@property (nonatomic,strong)NSArray *carGroups;

@end

@implementation ViewController

- (NSArray *)carGroups
{
    if (_carGroups == nil) {
        _carGroups = [JMCarGroup carGroupArray];
        //告诉JMExtension这个框架XMGCarGroup的cars数组属性装的是JMCar对象
//        [JMCarGroup mj_setupObjectClassInArray:^NSDictionary *{
//            return @{@"cars":[JMCar class]};
//        }];
//        _carGroups = [JMCar mj_objectArrayWithFilename:@"cars.plist"];
    }
    return _carGroups;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置索引条的文字颜色
    self.tableView.sectionIndexColor = [UIColor redColor];
    
    //设置索引条的背景颜色
    self.tableView.sectionIndexBackgroundColor = [UIColor yellowColor];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    JMCarGroup *cg = self.carGroups[section];
    return cg.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //访问缓存池
    static NSString *ID = @"car";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    //2.如果缓存池中没有，自己创建
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //3.设置数据
    JMCarGroup *cg = self.carGroups[indexPath.section];
    JMCar *ca = cg.cars[indexPath.row];
    
    cell.textLabel.text = ca.name;
    cell.imageView.image = [UIImage imageNamed:ca.icon];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    JMCarGroup *cg = self.carGroups[section];
    return cg.title;
}

/**
 *  返回索引条的文字
 */
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
//    NSMutableArray *titles = [NSMutableArray array];
//    for (JMCarGroup *group in self.carGroups) {
//        [titles addObject:group.title];
//    }
//    return ti;
    //抽取self.carGroups这个数组中每一个元素(JMCarGroup对象)的title属性的只，放在一个新的数组中
    return [self.carGroups valueForKeyPath:@"title"];
}

@end
