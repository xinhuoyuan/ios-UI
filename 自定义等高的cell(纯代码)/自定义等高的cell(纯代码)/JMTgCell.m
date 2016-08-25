//
//  JMTgCell.m
//  自定义等高的cell(纯代码)
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMTgCell.h"
#import "JMTg.h"

@interface JMTgCell()

/**
 *  图标
 */
@property (weak, nonatomic) UIImageView *iconView;
/**
 *  标题
 */
@property (weak, nonatomic) UILabel *titleLabel;
/**
 *  价值
 */
@property (weak, nonatomic) UILabel *priceLabel;
/**
 *  购买数
 */
@property (weak, nonatomic) UILabel *buyCountLabel;

@end

@implementation JMTgCell

//这个方法中添加所有的子控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /**
         *  图标
         */
        UIImageView *imgView =[[UIImageView alloc]init];
        [self.contentView addSubview:imgView];
        self.iconView = imgView;
        
        /**
         *  标题
         */
        UILabel *titLabel = [[UILabel alloc]init];
        [self.contentView addSubview:titLabel];
        self.titleLabel = titLabel;
        
        /**
         *  价格
         */
        UILabel *priceLab = [[UILabel alloc]init];
        priceLab.textColor = [UIColor orangeColor];
        priceLab.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:priceLab];
        self.priceLabel = priceLab;
        
        /**
         *  购买数
         */
        UILabel *buyContLab = [[UILabel alloc]init];
        buyContLab.textAlignment = NSTextAlignmentCenter;
        buyContLab.textColor = [UIColor lightGrayColor];
        buyContLab.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:buyContLab];
        self.buyCountLabel = buyContLab;
    }
    return self;
}

//设置所有的子控件fram
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat space = 10;
//    CGFloat contentViewW = self.contentView.frame.size.width;
    CGFloat contentViewW = CGRectGetWidth(self.contentView.frame);
//    CGFloat contentViewH = self.contentView.frame.size.height;
    CGFloat contentViewH = CGRectGetHeight(self.contentView.frame);
    /**
     *  图标
     */
    CGFloat iconX = space;
    CGFloat iconY = space;
    CGFloat iconW = 80;
    CGFloat iconH = contentViewH - 2 * space;
    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    /**
     *  标题
     */
//    CGFloat titleX = iconX + iconW + space;
    CGFloat titleX = CGRectGetMaxX(self.iconView.frame) + space;
    CGFloat titleY = iconY;
    CGFloat titlwW = contentViewW - titleX - space;
    CGFloat titleH = 20;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titlwW, titleH);
    
    /**
     *  价格
     */
    CGFloat priceW = 100;
    CGFloat priceH = 15;
    CGFloat priceX = titleX;
//    CGFloat priceY = iconY + iconH - priceH;
    CGFloat priceY = CGRectGetMaxY(self.iconView.frame) - priceH;
    self.priceLabel.frame = CGRectMake(priceX, priceY, priceW, priceH);
    
    /**
     *  购买数
     */
    CGFloat buyW = 150;
    CGFloat buyH = 14;
    CGFloat buyX = contentViewW - buyW - space;
//    CGFloat buyY = iconY + iconH - space;
    CGFloat buyY = CGRectGetMaxY(self.iconView.frame) - buyH;
    self.buyCountLabel.frame = CGRectMake(buyX, buyY, buyW, buyH);
}

- (void)setTg:(JMTg *)tg
{
    _tg = tg;
    self.iconView.image = [UIImage imageNamed:tg.icon];
    self.titleLabel.text = tg.title;
    self.priceLabel.text = [NSString stringWithFormat:@"¥%@",tg.price];
    self.buyCountLabel.text= [NSString stringWithFormat:@"%@人已购买",tg.buyCount];
}

@end
