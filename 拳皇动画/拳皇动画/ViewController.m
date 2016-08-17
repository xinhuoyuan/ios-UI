//
//  ViewController.m
//  拳皇动画
//
//  Created by apple on 16/8/17.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *showImage;

//播放器
@property (nonatomic,strong)AVPlayer *player;

@end

@implementation ViewController


/**
  图片的两种加载方式
  1>imageNamed:
     a.就算指向它的指针被销毁，该资源也不会被从内存中干掉
     b.放到Assets.xcassets的图片，默认就有缓存
     c.图片经常被使用
  2>imageWithContentsOfFile:
     a.指向它的指针被销毁，该资源会被从内存中干掉
     b.放到项目中的图片就不由缓存
     c.不经常用，大批量的图片
 */



//大招
- (IBAction)daZhao {
    [self loadImageWithName:@"dazhao" andCount:87 cishu:1 needstane:YES MusicName:@"dazhao.mp3"];
}
//死亡
- (IBAction)dead {
    [self loadImageWithName:@"dead" andCount:23 cishu:1 needstane:YES MusicName:nil];
}
//装逼
- (IBAction)zhuangBi {
    [self loadImageWithName:@"install_b" andCount:29 cishu:1 needstane:YES MusicName:nil];
}
//站立
- (IBAction)stand {
    [self loadImageWithName:@"stand" andCount:10 cishu:0 needstane:NO MusicName:nil];
}
//小招
- (IBAction)xiaoZhao {
    [self loadImageWithName:@"xiaozhao1" andCount:21 cishu:1 needstane:YES MusicName:@"xiaozhao1.mp3"];
}
//小招2
- (IBAction)xiaoZhao2 {
    [self loadImageWithName:@"xiaozhao2" andCount:35 cishu:1 needstane:YES MusicName:@"xiaozhao2.mp3"];
}
//小招3
- (IBAction)xiaoZhao3 {
    [self loadImageWithName:@"xiaozhao3" andCount:39 cishu:1 needstane:YES MusicName:@"xiaozhao3.mp3"];
}
//游戏结束
- (IBAction)gameOver {
    self.showImage.animationImages = nil;
}
//跑3
- (IBAction)run {
    [self loadImageWithName:@"run" andCount:6 cishu:1 needstane:YES MusicName:nil];
}
//公共方法
- (void)loadImageWithName:(NSString *)imgName andCount:(int)cout cishu:(int)num needstane:(BOOL)need MusicName:(NSString *)musicName{
    //1.加载所有的图片
    NSMutableArray<UIImage *> *imageArr = [NSMutableArray array];
    for (int i = 0; i<cout; i++) {
        //获取所有图片的名称
        NSString *imageNa = [NSString stringWithFormat:@"%@_%d.png",imgName,i+1];
        //创建UIImage
//        UIImage *image = [UIImage imageNamed:imageNa];
        NSString *imagePath = [[NSBundle mainBundle]pathForResource:imageNa ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        //装入数组
        [imageArr addObject:image];
    }
    //设置动画图片
    self.showImage.animationImages = imageArr;
    //设置播放次数
    self.showImage.animationRepeatCount = num;
    //设置播放的市场
    self.showImage.animationDuration = 0.0333 * cout;
    //播放
    [self.showImage startAnimating];
    
    //站立
    /**
     * Selector 方法
       Object 参数
       afterDelay 时间
       NSSelectorFromString(<#NSString * _Nonnull aSelectorName#>) 效果一样
     */
    if (need) {
        //播放
        NSURL *url = [[NSBundle mainBundle]URLForResource:musicName withExtension:nil];
        AVPlayerItem *playerItem = [[AVPlayerItem alloc]initWithURL:url];
        [self.player replaceCurrentItemWithPlayerItem:playerItem];
        [self.player play];
        //调节速率
        self.player.rate = self.showImage.animationDuration;
        
        
        [self performSelector:@selector(stand) withObject:nil afterDelay:self.showImage.animationDuration];
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self stand];
    
    //创建播放器
    self.player = [[AVPlayer alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
