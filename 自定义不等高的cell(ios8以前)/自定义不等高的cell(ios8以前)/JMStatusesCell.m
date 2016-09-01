

//
//  JMStatusesCell.m
//  自定义不等高的cell(ios8以前)
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMStatusesCell.h"
#import "JMStatuses.h"


@interface JMStatusesCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *NameLab;
@property (weak, nonatomic) IBOutlet UIImageView *vipImg;
@property (weak, nonatomic) IBOutlet UILabel *textLab;
@property (weak, nonatomic) IBOutlet UIImageView *showImg;

@end

@implementation JMStatusesCell

- (void)awakeFromNib {

    //手动设置文字的最大宽度(让label能够计算出自己真实的尺寸)
    self.textLab.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setStatuses:(JMStatuses *)statuses
{
    _statuses= statuses;
    self.iconImg.image = [UIImage imageNamed:statuses.icon];
    self.NameLab.text = statuses.name;
    if (statuses.isVip) {
        self.NameLab.textColor = [UIColor redColor];
        self.vipImg.hidden = NO;
    }else
    {
        self.NameLab.textColor = [UIColor blackColor];
        self.vipImg.hidden = YES;
    }
    
    self.textLab.text = statuses.text;
    
    if (statuses.picture) {
        self.showImg.hidden = NO;
        self.showImg.image = [UIImage imageNamed:statuses.picture];
    }else
    {
        self.showImg.hidden = YES;
    }
}


@end
