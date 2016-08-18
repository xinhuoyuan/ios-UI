
//
//  UIImage+Extension.m
//  图片的拉伸问题
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (instancetype)resizableImageWithImagename:(NSString *)name
{
    //创建图片对象
    UIImage *image = [UIImage imageNamed:name];
    
    //获取图片的尺寸
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    //返回一张拉伸且受保护的图片
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageHeight * 0.5, imageWidth * 0.5, imageHeight *0.5 - 1, imageWidth *0.5 - 1)];
}
@end
