//
//  JMButton.m
//  购物车(KVO)
//
//  Created by apple on 16/8/23.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMButton.h"

@implementation JMButton

- (void)awakeFromNib
{
    self.layer.borderWidth = 1.0;
    
    self.layer.borderColor = [UIColor redColor].CGColor;
    
    self.layer.cornerRadius = self.frame.size.width * 0.5;
}

@end
