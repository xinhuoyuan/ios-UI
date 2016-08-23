
//
//  JMWineCell.m
//  购物车尝试(代理模式)
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMWineCell.h"
#import "JMWine.h"
#import "JMButton.h"

@interface JMWineCell()
@property (weak, nonatomic) IBOutlet UIImageView *shopImage;
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *shopPrice;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet JMButton *miusBtn;

@end

@implementation JMWineCell


- (void)setWine:(JMWine *)wine
{
    _wine = wine;
    
    self.shopImage.image = [UIImage imageNamed:wine.image];
    self.shopName.text = wine.name;
    self.shopPrice.text = wine.money;
    
    self.countLabel.text = [NSString stringWithFormat:@"%d",self.wine.count];
    
    self.miusBtn.enabled = (self.wine.count > 0);
    
}

#pragma mark - 按钮店家

//加号按钮点击
- (IBAction)plusBtnClick {
    self.wine.count ++;
    
    self.countLabel.text = [NSString stringWithFormat:@"%d",self.wine.count];
    
    self.miusBtn.enabled = YES;
    
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"plusBtnClickNSNotification" object:self];
    if ([self.delegate respondsToSelector:@selector(plusBtnClick:)]) {
        [self.delegate plusBtnClick:self];
    }
}

//减号按钮点击
- (IBAction)miusBtnClick {
    self.wine.count --;
    
    self.countLabel.text = [NSString stringWithFormat:@"%d",self.wine.count];
    
    self.miusBtn.enabled = (self.wine.count !=0);
    
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"miusBtnClickNSNotification" object:nil];
    
    if ([self.delegate respondsToSelector:@selector(miusBtnClick:)]) {
        [self.delegate miusBtnClick:self];
    }
}

@end
