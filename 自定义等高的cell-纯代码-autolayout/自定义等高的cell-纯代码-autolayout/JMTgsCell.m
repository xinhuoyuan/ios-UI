//
//  JMTgsCell.m
//  自定义等高的cell-纯代码-autolayout
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMTgsCell.h"
#import "JMTgs.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface JMTgsCell()
/**
 *  图标
 */
@property (weak, nonatomic) UIImageView *iconView;
/**
 *  标题
 */
@property (weak, nonatomic) UILabel *titleLabel;
/**
 *  价格
 */
@property (weak, nonatomic) UILabel *priceLabel;
/**
 *  购买数
 */
@property (weak, nonatomic) UILabel *numLabel;
@end

@implementation JMTgsCell

//在这个方法中添加所有子控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat space = 10;
        //图标
        UIImageView *iconImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconImageView];
        self.iconView = iconImageView;
        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(space);
            make.bottom.equalTo(self.contentView).offset(-space);
            make.width.equalTo(80);
        }];
        
        //标题
        UILabel *titLab = [[UILabel alloc]init];
        [self.contentView addSubview:titLab];
        self.titleLabel = titLab;
        [titLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(iconImageView.top);
            make.right.equalTo(self.contentView).equalTo(-space);
            make.left.equalTo(iconImageView.right).equalTo(space);
            make.height.equalTo(20);
        }];
        //价格
        UILabel *priceLabel = [[UILabel alloc]init];
        priceLabel.textColor = [UIColor orangeColor];
        priceLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:priceLabel];
        self.priceLabel = priceLabel;
        [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titLab.left);
            make.bottom.equalTo(iconImageView.bottom);
            make.size.equalTo(CGSizeMake(100, 15));
        }];
        
        //购买数量
        UILabel *buyLab = [[UILabel alloc]init];
        buyLab.textAlignment = NSTextAlignmentRight;
        buyLab.textColor = [UIColor lightGrayColor];
        buyLab.font =[UIFont systemFontOfSize:14];
        [self.contentView addSubview:buyLab];
        self.numLabel  = buyLab;
        [buyLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(titLab.right);
            make.bottom.equalTo(priceLabel.bottom);
            make.size.equalTo(CGSizeMake(150, 14));
        }];
    }
    return self;
}

- (void)setTgs:(JMTgs *)tgs
{
    _tgs = tgs;
    
    self.iconView.image = [UIImage imageNamed:tgs.icon];
    self.titleLabel.text = tgs.title;
    self.priceLabel.text = tgs.price;
    self.numLabel.text = tgs.buyCount;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
