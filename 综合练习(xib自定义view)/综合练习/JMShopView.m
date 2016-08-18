//
//  JMShopView.m
//  综合练习
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMShopView.h"
#import "JMShop.h"

@interface JMShopView()
//图片控件
@property (weak, nonatomic) UIImageView *imgView;
//标题控件
@property (weak, nonatomic) UILabel *titleLabel;
@end

@implementation JMShopView

//初始化子控件(不要设置frame)
- (instancetype)init
{
    if (self = [super init]) {
        [self setUp];
    }
    return self;
}

- (instancetype)initWithShop:(JMShop *)shop
{
    if (self = [super init]) {
        //注意：先创建后赋值
        [self setUp];
        self.shop = shop;
    }
    return self;
}
//注意：创建对象用[[xxx alloc]init]方法和[[xxx alloc]initWithFrame]：方法都会调用initWithFrame
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

+ (instancetype)shopViewWithShop:(JMShop *)shop
{
    return [[self alloc]initWithShop:shop];
}

//初始化
- (void)setUp
{
    //1.创建商品的UIImageView对象
    UIImageView *iconView = [[UIImageView alloc]init];
    //        iconView.frame = CGRectMake(0, 0, width, height);
    iconView.backgroundColor = [UIColor blueColor];
    [self addSubview:iconView];
    self.imgView = iconView;
    
    //2.创建商品标题对象
    UILabel *titleLabel = [[UILabel alloc]init];
    //        titleLabel.frame = CGRectMake(0, width, width, height - width);
    titleLabel.backgroundColor = [UIColor yellowColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;//居中
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
}

//布局子控件(可以拿到frame)
- (void)layoutSubviews
{
    //一定要调用super
    [super layoutSubviews];
    
    //获取当前控件的尺寸
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    //设置子控件的frame
    self.imgView.frame = CGRectMake(0, 0, width, width);
    self.titleLabel.frame = CGRectMake(0, width, width, height - width);
}

/*
 set方法:只要外边穿数据就会调用
 作用:设置数据
 */
- (void)setShop:(JMShop *)shop
{
    _shop = shop;
    self.imgView.image = [UIImage imageNamed:shop.icon];
    self.titleLabel.text = shop.name;
}




@end
