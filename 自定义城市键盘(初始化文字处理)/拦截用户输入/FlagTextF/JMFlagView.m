//
//  JMFlagView.m
//  拦截用户输入
//
//  Created by apple on 16/9/5.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMFlagView.h"
#import "JMFlags.h"

@interface JMFlagView()
@property (weak, nonatomic) IBOutlet UILabel *showLab;
@property (weak, nonatomic) IBOutlet UIImageView *showImg;

@end

@implementation JMFlagView

+ (instancetype)flagView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"JMFlagView" owner:nil options:nil]lastObject];
}


- (void)setFlags:(JMFlags *)flags
{
    _flags = flags;
    self.showLab.text = flags.name;
    self.showImg.image = flags.icon;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
