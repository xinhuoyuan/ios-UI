//
//  JMTgsCell.m
//  自定义等高的cell-xib
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMTgsCell.h"
#import "JMTgs.h"

@interface JMTgsCell()
@property (weak, nonatomic) IBOutlet UIImageView *shopImage;
@property (weak, nonatomic) IBOutlet UILabel *shoptitle;
@property (weak, nonatomic) IBOutlet UILabel *shopPrice;
@property (weak, nonatomic) IBOutlet UILabel *shopNum;

@end

@implementation JMTgsCell

- (void)setTgs:(JMTgs *)tgs
{
    _tgs = tgs;
    self.shopImage.image = [UIImage imageNamed:tgs.icon];
    self.shoptitle.text = tgs.title;
    self.shopPrice.text = tgs.price;
    self.shopNum.text = tgs.buyCount;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
