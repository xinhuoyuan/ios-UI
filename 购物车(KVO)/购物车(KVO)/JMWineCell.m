

//
//  JMWineCell.m
//  购物车(KVO)
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
@property (weak, nonatomic) IBOutlet JMButton *miusBtn;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation JMWineCell

- (void)setWine:(JMWine *)wine
{
    _wine = wine;
    
    self.shopImage.image = [UIImage imageNamed:wine.image];
    
    self.shopName.text = wine.name;
    
    self.shopPrice.text = wine.money;
    
    self.countLabel.text = [NSString stringWithFormat:@"%d",wine.count];
    
    self.miusBtn.enabled = (self.countLabel.text.intValue>0);
    
}

#pragma maerk - 按钮点击
- (IBAction)miusBtnClick {
    self.wine.count --;
    
    self.countLabel.text = [NSString stringWithFormat:@"%d",self.wine.count];
    
    self.miusBtn.enabled = (self.wine.count != 0);
    
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"miusBtnNSNotification" object:self];

//    if ([self.delegate respondsToSelector:@selector(JMWineCellMiusBtnWithCell:)]) {
//        [self.delegate JMWineCellMiusBtnWithCell:self];
//    }
}
- (IBAction)plusBtnClick {
    self.wine.count ++;
    
    self.countLabel.text = [NSString stringWithFormat:@"%d",self.wine.count];
    
    self.miusBtn.enabled = YES;
    
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"plusBtnNSNotification" object:self];
//    if ([self.delegate respondsToSelector:@selector(JMWineCellPlusBtnWithCell:)]) {
//        [self.delegate JMWineCellPlusBtnWithCell:self];
//    }
}

@end
