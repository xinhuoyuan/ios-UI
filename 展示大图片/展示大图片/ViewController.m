//
//  ViewController.m
//  展示大图片
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *ScView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.UIImageView
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    [self.ScView addSubview:imageView];
    //2.设置contentSize
    self.ScView.contentSize = image.size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
