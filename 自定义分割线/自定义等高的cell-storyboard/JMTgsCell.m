//
//  JMTgsCell.m
//  自定义等高的cell-storyboard
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMTgsCell.h"
#import "JMTgs.h"

@interface JMTgsCell()
@property (weak, nonatomic) IBOutlet UIImageView *shopImg;
@property (weak, nonatomic) IBOutlet UILabel *shopTitle;
@property (weak, nonatomic) IBOutlet UILabel *shopPrice;
@property (weak, nonatomic) IBOutlet UILabel *shopBuyCount;

@end

@implementation JMTgsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTgs:(JMTgs *)tgs
{
    _tgs = tgs;
    self.shopImg.image = [UIImage imageNamed: tgs.icon];
    self.shopTitle.text = tgs.title;
    self.shopPrice.text = tgs.price;
    self.shopBuyCount.text = [NSString stringWithFormat:@"已有%@人关注",tgs.buyCount];
}

@end
