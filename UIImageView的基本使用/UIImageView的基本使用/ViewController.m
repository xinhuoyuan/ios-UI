//
//  ViewController.m
//  UIImageView的基本使用
//
//  Created by apple on 16/8/17.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.创建UImageView对象
    UIImageView *imageView =[[UIImageView alloc]init];
    //2.设置尺寸
//    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    imageView.frame = self.view.bounds;
    //3.设置背景颜色
    imageView.backgroundColor = [UIColor redColor];
    //4.设置背景图片
    imageView.image = [UIImage imageNamed:@"1"];
    //5.设置图片的内容模式
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    //6.加毛玻璃
    //6.1创建UITooBar对象
    UIToolbar *toolBar = [[UIToolbar alloc]init];
    //6.2设置toolBar的frame
    toolBar.frame = imageView.frame;
    //6.3设置毛玻璃的样式
    toolBar.barStyle = UIBarStyleBlack;
    toolBar.alpha = 0.98;
    //6.4加到imageView中
    [imageView addSubview:toolBar];
    
    //加载到控制器的View中
    [self.view addSubview:imageView];
    
}


- (void)test
{
    //1.1创建UIImageView对象
    UIImageView *imageView = [[UIImageView alloc]init];
    
    //1.2设置frame
    imageView.frame = CGRectMake(100, 100, 250, 200);
    
    //1.3设置背景
    imageView.backgroundColor = [UIColor greenColor];
    
    //1.4设置图片(png不需要后缀)
    imageView.image = [UIImage imageNamed:@"1"];
    
    
    /*
     
     UIViewContentModeRedraw, //重新绘制(核心绘制) drawRact
     
     //带有Scle,表明图片有可能被拉伸或者压缩
     UIViewContentModeScaleToFill,
     //Aspect 比例，缩放是带有比例的
     UIViewContentModeScaleAspectFit, //宽高比不变 Fit 适应
     UIViewContentModeScaleAspectFill, //宽高比不变 Fill 填充
     //不带有Scale，表明图片不可能被拉伸或者压缩
     UIViewContentModeCenter,
     UIViewContentModeTop,
     UIViewContentModeBottom,
     UIViewContentModeLeft,
     UIViewContentModeRight,
     UIViewContentModeTopLeft,
     UIViewContentModeTopRight,
     UIViewContentModeBottomLeft,
     UIViewContentModeBottomRight,
     */
    
    //1.5设置图片的内容模式
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    //2.0加载到控制器的view中
    [self.view addSubview:imageView];
    
    //裁剪多余的部分
    imageView.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
