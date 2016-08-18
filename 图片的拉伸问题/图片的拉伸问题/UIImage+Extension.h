//
//  UIImage+Extension.h
//  图片的拉伸问题
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
//返回一张受保护的图片(被拉伸的)
+ (instancetype)resizableImageWithImagename:(NSString *)name;
@end
