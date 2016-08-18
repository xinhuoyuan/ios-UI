//
//  ViewController.m
//  综合练习
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "JMShop.h"
#import "JMShopView.h"

@interface ViewController ()
//购物车
@property (weak, nonatomic) IBOutlet UIView *shopCarView;
//删除按钮
@property (weak, nonatomic) IBOutlet UIButton *DeleteBtn;
//添加按钮
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

//数据数组
@property (nonatomic,strong)NSArray *dataArr;

@end

@implementation ViewController

/*
 懒加载
 1.作用：
 1>用到的时候再加载
 2>全局只会被加载一次
 3>全局都可以使用
 过程:
 1.重写成员变量的get方法
 2.在get方法中判断：
   1>如果为空，加载数据
   2>如果不为空，就直接反悔数据
 */

- (NSArray *)dataArr
{
    if (_dataArr == nil) {
        //加载数据
        //1.获取全路径
        NSString *dataPath = [[NSBundle mainBundle]pathForResource:@"shopData.plist" ofType:nil];
        self.dataArr = [NSArray arrayWithContentsOfFile:dataPath];
        //字典转模型
        //创建临时数组
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in self.dataArr) {
            //创建shopview对象
            JMShop *shop = [JMShop shopViewWithDict:dict];
            //把模型装入数组
            [arrayM addObject:shop];
        }
        _dataArr = arrayM;
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


//添加到购物车
- (IBAction)addView:(UIButton *)button {
    //定义一些常量
    //1.总列数
    NSInteger allCols = 3;
    //2.商品的宽度 和 高度
    CGFloat width  = 80;
    CGFloat height = 100;
    //3.求出水平间距和垂直间距
    CGFloat hMargin = (self.shopCarView.frame.size.width - allCols * width)/(allCols - 1);
    CGFloat wMargin = (self.shopCarView.frame.size.height - 2 *height)/1;
    //设置索引
    NSInteger index = self.shopCarView.subviews.count;
    //求出x值
    CGFloat x = (hMargin + width) * (index % allCols);
    CGFloat y = (wMargin + height)* (index / allCols);
    
    //2.创建一个商品
    JMShopView *spView = [[JMShopView alloc]init];
    spView.frame = CGRectMake(x, y, width, height);
    [self.shopCarView addSubview:spView];
    
    // 设置数据
    JMShop *dict = self.dataArr[index];
//    spView.imgView.image = [UIImage imageNamed:dict.icon];
//    spView.titleLabel.text = dict.name;
    [spView setIcon:dict.icon];
    [spView setName:dict.name];
    
    //3.设置按钮的状态
    
    button.enabled = (index != 5);
    
    //5.设置删除按钮的状态
    self.DeleteBtn.enabled = YES;
    

}

//从购物车中删除
- (IBAction)removeView:(UIButton *)button {
    //1.删除最后一个商品
    UIView *lastShopView = [self.shopCarView.subviews lastObject];
    [lastShopView removeFromSuperview];

    //3.色织添加按钮的状态
    self.addBtn.enabled = YES;
    
    //设置删除按钮的状态
    self.DeleteBtn.enabled = (self.shopCarView.subviews.count != 0);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
