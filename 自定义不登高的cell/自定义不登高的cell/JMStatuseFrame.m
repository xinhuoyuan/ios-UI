//
//  JMStatuseFrame.m
//  自定义不登高的cell
//
//  Created by apple on 16/8/26.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//
#define JMNameFont [UIFont systemFontOfSize:14]
#define JMTextFont [UIFont systemFontOfSize:14]
#import "JMStatuseFrame.h"
#import "JMStatuse.h"

@implementation JMStatuseFrame

- (void)setStatuse:(JMStatuse *)statuse
{
    _statuse = statuse;
    
    CGFloat space = 10;
    /**
     *  图像
     */
    CGFloat iconX = space;
    CGFloat iconY = space;
    CGFloat iconWH = 30;
    _iconFrame = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    /**
     *  昵称
     */
    CGFloat nameX = CGRectGetMaxX(_iconFrame)+space;
    CGFloat nameY = iconY;
    NSDictionary *nameAtt = @{NSFontAttributeName:JMNameFont};
    //计算昵称文字的尺寸
    CGSize nameSize = [statuse.name sizeWithAttributes:nameAtt];
    CGFloat nameW = nameSize.width;
    CGFloat nameH = nameSize.height;
    _nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
    
    /**
     *  vip
     */
    if (statuse.isVip) {
        CGFloat vipX = CGRectGetMaxX(_nameFrame) + space;
        CGFloat vipY = nameY;
        CGFloat vipW = 14;
        CGFloat vipH = nameH;
        _vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
    }
    
    //正文
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconFrame)+space;
    CGFloat textW = [UIScreen mainScreen].bounds.size.width - 2*space;;
    NSDictionary *textAtt = @{NSFontAttributeName:JMTextFont};
    //最大宽度是textW,高度不限制
    CGSize textSize = CGSizeMake(textW, MAXFLOAT);
    CGFloat textH = [statuse.text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAtt context:nil].size.height;
    _textFrame = CGRectMake(textX, textY, textW, textH);
    
    //配图
    if (statuse.picture) {
        CGFloat pictureWH = 100;
        CGFloat pictureX = textX;
        CGFloat pictureY = CGRectGetMaxY(_textFrame)+space;
        _pictureFrame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);
        _cellHeight = CGRectGetMaxY(_pictureFrame)+space;
    }else
    {
        _cellHeight = CGRectGetMaxY(_textFrame)+space;
    }
}
    
+ (NSMutableArray *)statuessFrame
{
    NSArray *ary = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in ary) {
        JMStatuse *sta = [JMStatuse statuseWithDict:dict];
        JMStatuseFrame *sFa = [[JMStatuseFrame alloc]init];
        sFa.statuse = sta;
        [arrayM addObject:sFa];
    }
    return arrayM;
}

@end
