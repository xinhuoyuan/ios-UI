//
//  JMWineCell.m
//  购物车
//
//  Created by apple on 16/8/22.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMWineCell.h"
#import "JMWine.h"
#import "JMClickBtn.h"
/**
 *  累扩展
 */
@interface JMWineCell()
@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property (weak, nonatomic) IBOutlet UILabel *showName;
@property (weak, nonatomic) IBOutlet UILabel *showMoney;
/**
 *  减号按钮
 */
@property (weak, nonatomic) IBOutlet JMClickBtn *minusBtn;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation JMWineCell

- (void)setWine:(JMWine *)wine
{
    _wine = wine;
    
    self.showImage.image = [UIImage imageNamed:wine.image];
    self.showName.text = wine.name;
    self.showMoney.text = wine.money;
    
    //设置numberLabel的数据
    self.numberLabel.text = [NSString stringWithFormat:@"%d",self.wine.count];
    
    self.minusBtn.enabled = (self.wine.count > 0);
}

#pragma mark - 按钮点击
/**
 *  加号按钮点击
 */
- (IBAction)plusBtnClick {
    self.wine.count ++;
    
    self.numberLabel.text = [NSString stringWithFormat:@"%d",self.wine.count];
    
    self.minusBtn.enabled = YES;
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"plusClickNSNotification" object:self];
}

/**
 *  减号按钮点击
 */
- (IBAction)minusBtnClick {
    
    self.wine.count --;
    
    self.numberLabel.text = [NSString stringWithFormat:@"%d",self.wine.count];
    
    self.minusBtn.enabled = (self.wine.count != 0);
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"miusClickNSNotification" object:self];
}


@end
