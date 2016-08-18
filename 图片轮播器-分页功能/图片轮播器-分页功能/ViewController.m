//
//  ViewController.m
//  图片轮播器-分页功能
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.添加图片
    CGFloat scrollW = self.scView.bounds.size.width;
    CGFloat scrollH = self.scView.bounds.size.height;
    int count = 5;
    for (int i = 0; i<count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        NSString *imgName= [NSString stringWithFormat:@"img_0%d",i+1];
        imageView.image = [UIImage imageNamed:imgName];
        imageView.frame = CGRectMake(i*scrollW, 0, scrollW, scrollH);
        [self.scView addSubview:imageView];
    }
    
    //2.色获知contentSize
    self.scView.contentSize = CGSizeMake( count * scrollW, 0);
    
    //3.开启分页功能
    //标准:以scrollView的尺寸为一页
    self.scView.pagingEnabled = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
