//
//  JMShopView.m
//  通过xib自定义商品的view
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//



/*
 xib使用注意是想:
 1>如果一个view从xib中加载，就不能用[xxx alloc]init] 和[xxx alloc]initWithFrame:]chaungj
 2>如果一个xib经常被使用，应该提供快速构造类方法
 3>如果一个view从xib中加载:
 用代码添加一些子控件，得在initWithCoder:和awakerFromNib创建
 4>如果一个view从xib中加载，会调用initWithCoder:和awakerFromNib,不会调用init和initWithFrame方法
 */

#import "JMShopView.h"

@interface JMShopView()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;

//测试label
@property (weak, nonatomic) UILabel *label;

//毛玻璃
@property (weak, nonatomic) UIToolbar *toolBar;
@end

@implementation JMShopView

//如果view从xib中加载，就不会调用init和initWithFrame:方法
- (instancetype)init
{
    if (self = [super init]) {
        NSLog(@"%s",__func__);
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        NSLog(@"%s",__func__);
    }
    return self;
}

/*
 如果View从xib中加载,就会调用initWithCoder:方法
 创建子控件,...
 注意:如果子控件是从xib中创建的，，是处于未唤醒状态
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        UILabel *label = [[UILabel alloc]init];
        label.backgroundColor = [UIColor greenColor];
        label.text = @"asdasd";
        [self addSubview:label];
        self.label = label;
    }
    return self;
}

#pragma mark - xib加载原理
- (UIView *)loadFormNib{
    JMShopView *shopView = [[JMShopView alloc]initWithCoder:nil];
    shopView.frame = CGRectMake(0, 0, 80, 100);
    
    UIImageView *iconView = [[UIImageView alloc]initWithCoder:nil];
    iconView.backgroundColor = [UIColor greenColor];
    iconView.frame = CGRectMake(0, 0, 80, 80);
    iconView.tag = 100;
    [shopView addSubview:iconView];
    
    UILabel *label = [[UILabel alloc]initWithCoder:nil];
    label.backgroundColor = [UIColor orangeColor];
    label.tag = 200;
    [shopView addSubview:label];
    self.label = label;
    
    return shopView;
}

/*
 从xib中唤醒
 添加到xib中创建的子控件的子控件
 */
- (void)awakeFromNib
{
    //往imageView上添加毛玻璃
//    UIToolbar *toolBar = [[UIToolbar alloc]init];
//    [self.iconView addSubview:toolBar];
//    self.toolBar = toolBar;
}

#pragma mark - 快速构造方法
+ (instancetype)shopView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"JMShopView" owner:nil options:nil]lastObject];
}

#pragma mark - 布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.toolBar.frame = self.iconView.bounds;
}

#pragma mark - 设置数据

- (void)setIcon:(NSString *)icon
{
    self.iconView.image = [UIImage imageNamed:icon];
}

- (void)setName:(NSString *)name
{
    self.titleView.text = name;
}



@end
