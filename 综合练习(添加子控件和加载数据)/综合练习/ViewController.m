//
//  ViewController.m
//  综合练习
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//购物车
@property (weak, nonatomic) IBOutlet UIView *shopCarView;
//删除按钮
@property (weak, nonatomic) IBOutlet UIButton *DeleteBtn;
//添加按钮
@property (weak, nonatomic) IBOutlet UIButton *addBtn;


//全局的下标
@property (nonatomic,assign)NSInteger index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //给下标赋值
//    self.index = 0;
    
    //裁剪多余部分(不可取)
//    self.shopCarView.clipsToBounds = YES;
    
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
    //2.1创建商品的view
    UIView *shopView = [[UIView alloc]init];
    //2.设置frame
    shopView.frame = CGRectMake(x, y, width, height);
    //3.设置背景颜色
    shopView.backgroundColor = [UIColor greenColor];
    //4.添加到购物车
    [self.shopCarView addSubview:shopView];
    //5.创建商品的UIImageView对象
    UIImageView *iconView = [[UIImageView alloc]init];
    iconView.frame = CGRectMake(0, 0, width, width);
    iconView.backgroundColor = [UIColor blueColor];
    [shopView addSubview:iconView];
    //6.创建商品标题对象
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.frame = CGRectMake(0, width, width, height - width);
    titleLabel.backgroundColor = [UIColor yellowColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [shopView addSubview:titleLabel];
    //设置数据
    //方式一:(不可取：数据都一样)
//    iconView.image = [UIImage imageNamed:@"danjianbao"];
//    titleLabel.text = @"单肩包";
    //方式二:(不可取:太冗余)
    /*
     if (index == 0) {
     iconView.image = [UIImage imageNamed:@"danjianbao"];
     titleLabel.text = @"单肩包";
     }else if (index == 1){
     iconView.image = [UIImage imageNamed:@"qianbao"];
     titleLabel.text = @"钱包";
     }else if (index == 2){
     iconView.image = [UIImage imageNamed:@"danjianbao"];
     titleLabel.text = @"单肩包";
     }else if (index == 3){
     iconView.image = [UIImage imageNamed:@"danjianbao"];
     titleLabel.text = @"单肩包";
     }else if (index == 4){
     iconView.image = [UIImage imageNamed:@"danjianbao"];
     titleLabel.text = @"单肩包";
     }else if (index == 5){
     iconView.image = [UIImage imageNamed:@"danjianbao"];
     titleLabel.text = @"单肩包";
     }
     */
    
    // 方式三 (数组: (两个数组之间没有任何联系,容易出错))
    /*
     NSArray<NSString *> *imageNames = @[@"danjianbao", @"qianbao", @"liantiaobao", @"shoutibao", @"shuangjianbao", @"xiekuabao"];
     NSArray<NSString *> *titleNames = @[@"单肩包", @"钱包", @"链条包", @"手提包", @"双肩包", @"斜挎包"];
     // 设置数据
     iconView.image = [UIImage imageNamed:imageNames[index]];
     titleLabel.text = titleNames[index];
     */
    
    // 方式四 (数组 + 字典)
    NSArray<NSDictionary *> *dataArr = @[
                                         @{@"name":@"单肩包", @"icon":@"danjianbao"},
                                         @{@"name":@"钱包", @"icon":@"qianbao"},
                                         @{@"name":@"链条包", @"icon":@"liantiaobao"},
                                         @{@"name":@"手提包", @"icon":@"shoutibao"},
                                         @{@"name":@"双肩包", @"icon":@"shuangjianbao"},
                                         @{@"name":@"斜挎包", @"icon":@"xiekuabao"}
                                         ];
    // 设置数据
    NSDictionary *dict = dataArr[index];
    iconView.image = [UIImage imageNamed:dict[@"icon"]];
    titleLabel.text = dict[@"name"];
    
    
    //3.设置按钮的状态
//    if (index == 5) {
//        button.enabled = NO;
//    }
    
    button.enabled = (index != 5);
    
    //5.设置删除按钮的状态
    self.DeleteBtn.enabled = YES;
    
    //让下标+1
//    self.index +=1;
}

//从购物车中删除
- (IBAction)removeView:(UIButton *)button {
    //1.删除最后一个商品
    UIView *lastShopView = [self.shopCarView.subviews lastObject];
    [lastShopView removeFromSuperview];
    
    //2.设置索引 -1
//    self.index -= 1;
    //3.色织添加按钮的状态
    self.addBtn.enabled = YES;
    
    //设置删除按钮的状态
//    if (self.shopCarView.subviews.count == 0) {
//        self.DeleteBtn.enabled = NO;
//    }
    self.DeleteBtn.enabled = (self.shopCarView.subviews.count != 0);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
