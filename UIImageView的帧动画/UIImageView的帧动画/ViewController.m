//
//  ViewController.m
//  UIImageView的帧动画
//
//  Created by apple on 16/8/17.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//属性
@property (weak, nonatomic) IBOutlet UIImageView *shwoImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - 开始动画
- (IBAction)BeginAnimation {
    //1.1 加载所有的图片
    NSMutableArray<UIImage *> *imageArr = [NSMutableArray array];
    for (int i = 0; i<20; i++) {
        //获取图片的名称
        NSString *imageName = [NSString stringWithFormat:@"%d",i+1];
        //创建UIImage对象
        UIImage *image = [UIImage imageNamed:imageName];
        //加入数组
        [imageArr addObject:image];
    }
    //设置动画图片
    self.shwoImage.animationImages = imageArr;
    //设置动画的播放次数
    self.shwoImage.animationRepeatCount = 0;
    //设置播放时长
    //1秒30桢,一张图片的时间=1/30 = 0.03333 20 * 0.0333
    self.shwoImage.animationDuration = 1.0;
    //开始动画
    [self.shwoImage startAnimating];
}
- (IBAction)stopAnimation {
    [self.shwoImage stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
