//
//  ViewController.m
//  图片的拉伸问题
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Extension.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *showBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.1创建UIImage对象
    UIImage *image = [UIImage resizableImageWithImagename:@"chat_send_nor"];
    //    UIImage *image = [UIImage imageNamed:@"chat_send_nor"];
    //1.2拿到image的尺寸
//    CGFloat imageWidth = image.size.width;
//    CGFloat imageHeight = image.size.height;
    
    //1.3返回一张受保护而且拉伸的图片 -->CapInsets:哪些地方要保护
    //方式一
//    UIImage *resizableImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageHeight * 0.5, imageWidth * 0.5, imageHeight * 0.5 -1, imageWidth * 0.5 - 1)];
    
    /*
     UIImageResizingModeTile, 平铺
     UIImageResizingModeStretch, 拉伸(伸缩)
     */
//    UIImage *resizaleImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageHeight * 0.5, imageWidth * 0.5, imageHeight * 0.5 - 1, imageWidth * 0.5 -1) resizingMode:UIImageResizingModeTile];
    
    //方式二
    //右边需要保护的区域 ＝ 图片的width - leftCapWidth - 1
    // bottom cap = height - topCapHeight - 1
//    UIImage *resizableImage = [image stretchableImageWithLeftCapWidth:imageWidth * 0.5 topCapHeight:imageHeight * 0.5];
    
    //2.吧图片设置到按钮上
    [self.showBtn setBackgroundImage:image forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
