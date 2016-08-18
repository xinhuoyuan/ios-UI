//
//  JMdeShopView.m
//  综合练习
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMdeShopView.h"
#import "JMShop.h"

@interface JMdeShopView()
@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property (weak, nonatomic) IBOutlet UILabel *showlabel;

@end

@implementation JMdeShopView

+ (instancetype)shopView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"JMdeShopView" owner:nil options:nil]lastObject];
}

- (void)setShop:(JMShop *)shop
{
    _shop = shop;

    //设置子控件的数据
    self.showImage.image = [UIImage imageNamed:shop.icon];
    
    self.showlabel.text = shop.name;
}

@end
