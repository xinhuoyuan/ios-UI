
//
//  JMStatusesCell.m
//  自定义不登高的cell
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMStatusesCell.h"
#import "JMStatuse.h"
#import "JMStatuseFrame.h"
#define JMNameFont [UIFont systemFontOfSize:14]
#define JMTextFont [UIFont systemFontOfSize:14]

@interface JMStatusesCell()
/**
 *  头像
 */
@property (weak, nonatomic) UIImageView *iconImg;
/**
 *  昵称
 */
@property (weak, nonatomic) UILabel *nameLab;
/**
 *  vip
 */
@property (weak, nonatomic) UIImageView *vipImg;
/**
 *  正文
 */
@property (weak, nonatomic) UILabel *textLab;
/**
 *  配图
 */
@property (weak, nonatomic) UIImageView *picImg;
@end

@implementation JMStatusesCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /**
         *  头像
         */
        UIImageView *iconImg = [[UIImageView alloc]init];
        [self.contentView addSubview:iconImg];
        self.iconImg = iconImg;
        
        /**
         *  昵称
         */
        UILabel *nameLab = [[UILabel alloc]init];
        nameLab.font = JMNameFont;
        [self.contentView addSubview:nameLab];
        self.nameLab = nameLab;
        /**
         *  vip
         */
        UIImageView *vipImg = [[UIImageView alloc]init];
        vipImg.contentMode = UIViewContentModeCenter;
        vipImg.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipImg];
        self.vipImg = vipImg;
        
        /**
         *  内容
         */
        UILabel *textLab = [[UILabel alloc]init];
        textLab.font = JMTextFont;
        textLab.numberOfLines = 0;
        [self.contentView addSubview:textLab];
        self.textLab = textLab;
        /**
         *  配图
         */
        UIImageView *picImg = [[UIImageView alloc]init];
        [self.contentView addSubview:picImg];
        self.picImg = picImg;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
  
    self.iconImg.frame = self.sFrame.iconFrame;
    self.nameLab.frame = self.sFrame.nameFrame;
    self.vipImg.frame = self.sFrame.vipFrame;
    self.textLab.frame = self.sFrame.textFrame;
    self.picImg.frame = self.sFrame.pictureFrame;
    
}

- (void)setSFrame:(JMStatuseFrame *)sFrame
{
    _sFrame = sFrame;
    JMStatuse *statues = sFrame.statuse;
    self.iconImg.image = [UIImage imageNamed:statues.icon];
    self.nameLab.text = statues.name;
    if (statues.isVip) {
        self.nameLab.textColor = [UIColor redColor];
        self.vipImg.hidden = NO;
    }else
    {
        self.nameLab.textColor = [UIColor blackColor];
        self.vipImg.hidden = YES;
    }
    
    self.textLab.text = statues.text;
    
    if (statues.picture) {
        self.picImg.hidden = NO;
        self.picImg.image = [UIImage imageNamed:statues.picture];
        
    }else
    {
        self.picImg.hidden = YES;
    }

}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
