
//
//  JMStatusesCell.m
//  自定义不等高cell-storyboard(ios8之后)
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMStatusesCell.h"
#import "JMStatuses.h"

@interface JMStatusesCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UIImageView *vipImg;
@property (weak, nonatomic) IBOutlet UILabel *textLab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttomShowImg;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *showImgHeight;
@property (weak, nonatomic) IBOutlet UIImageView *showImg;
@end

@implementation JMStatusesCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//设置子控件数据
- (void)setStatuses:(JMStatuses *)statuses
{
    _statuses = statuses;
    
    self.iconImg.image = [UIImage imageNamed:statuses.icon];
    self.nameLab.text = statuses.name;
    if (statuses.isVip) {
        self.nameLab.textColor = [UIColor redColor];
        self.vipImg.hidden = NO;
    }else
    {
        self.nameLab.textColor = [UIColor blackColor];
        self.vipImg.hidden = YES;
    }
    
    self.textLab.text = statuses.text;
    if (statuses.picture) {
        self.showImg.image = [UIImage imageNamed:statuses.picture];
        self.showImg.hidden = NO;
        self.showImgHeight.constant = 100;
        self.buttomShowImg.constant = 10;
    }else
    {
        self.showImg.hidden = YES;
        self.showImgHeight.constant = 0;
        self.buttomShowImg.constant = 0;
    }
}

@end
