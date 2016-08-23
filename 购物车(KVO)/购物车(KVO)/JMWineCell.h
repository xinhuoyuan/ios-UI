//
//  JMWineCell.h
//  购物车(KVO)
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JMWine,JMWineCell;

//@protocol JMWineCellDelegate <NSObject>
//
//- (void)JMWineCellPlusBtnWithCell:(JMWineCell *)cell;
//- (void)JMWineCellMiusBtnWithCell:(JMWineCell *)cell;
//
//@end


@interface JMWineCell : UITableViewCell

//模型
@property (nonatomic,strong)JMWine *wine;

//@property (weak, nonatomic) id <JMWineCellDelegate>delegate;

@end
