


//
//  JMPerson.m
//  模拟通知
//
//  Created by apple on 16/8/22.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "JMPerson.h"

@implementation JMPerson

- (void)getNew:(NSNotification *)note
{
    NSLog(@"[%@]接收到了[%@]发布的[%@]通知，通知内容是:[%@]",self.name,[note.object name],note.name,note.userInfo);
}

//- (void)dealloc
//{
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
//}


@end
