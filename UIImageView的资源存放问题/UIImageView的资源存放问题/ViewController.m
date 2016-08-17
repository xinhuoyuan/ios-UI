//
//  ViewController.m
//  UIImageView的资源存放问题
//
//  Created by apple on 16/8/17.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"


/**
 *  加载图片的方式
    1.imageNamed:
    2.imageWithContentsOfFile:
    
    1.加载Assets.xcassets这里面的图片：
     1>打包后变成Assets.car
     2>拿不到路径
     3>只能通过imageNamed:来加载图片
     4>不能通过imageWithContentsOfFile:来加载图片
    2.放到项目中的图片:
     1>可以拿到路径
     2>能通过imageNamed:来加载图片
     3>也能通过imageWithContentsOfFile:来加载图片
 */


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *showImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //图片的设置方式
    
    //方式一
//    self.showImage.image = [UIImage imageNamed:@"1"];
    //方式二
    //路径
    NSString *path = [[NSBundle mainBundle]pathForResource:@"1" ofType:@"png"];
    self.showImage.image = [UIImage imageWithContentsOfFile:path];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
