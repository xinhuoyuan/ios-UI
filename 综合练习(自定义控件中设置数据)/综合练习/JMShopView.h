//
//  JMShopView.h
//  综合练习
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMShopView : UIView
//readonly 只会调用get方法
//图片控件
//@property (weak, nonatomic,readonly) UIImageView *imgView;
//标题控件
//@property (weak, nonatomic,readonly) UILabel *titleLabel;

//提供接口方法
- (void)setIcon:(NSString *)icon;
- (void)setName:(NSString *)name;

@end
