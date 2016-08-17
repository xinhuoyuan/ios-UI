//
//  ViewController.m
//  ios中播放音效
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
//背景图片
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
//播放器
@property (nonatomic,strong)AVPlayer *avplayer;
@end

@implementation ViewController
//播放暂停
- (IBAction)startAndsto:(UIButton *)sender {
    switch (sender.tag) {
        case 3:
            [self.avplayer play]; // 播放
            break;
        case 4:
            [self.avplayer pause]; // 暂停
        default:
            break;
    }
}
//切换歌曲
- (IBAction)leftAndRight:(UIButton *)sender {
    //歌曲的名称
    NSString *musicName = nil;
    switch (sender.tag) {
        case 1:
            musicName = @"mySong2.mp3";
            break;
        case 2:
            musicName = @"mySong3.mp3";
            break;
        default:
            break;
    }
    
    NSURL *url = [[NSBundle mainBundle]URLForResource:musicName withExtension:nil];
    AVPlayerItem *playerItem = [[AVPlayerItem alloc]initWithURL:url];
    [self.avplayer replaceCurrentItemWithPlayerItem:playerItem];
    //播放
    [self.avplayer play];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //加毛玻璃
    UIToolbar *toolbar = [[UIToolbar alloc]init];
    
    //设置frame
    toolbar.frame = self.bgImage.frame;
    //设置透明度
    toolbar.barStyle = UIBarStyleBlack;
    toolbar.alpha = 0.98;
    //加到背景图片上
    [self.bgImage addSubview:toolbar];
    
    //创建播放器
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"mySong1.mp3" ofType:nil];
//    NSURL *url = [NSURL fileURLWithPath:path];
    
    //资源的URL地址
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"mySong1.mp3" withExtension:nil];
    //创建播放器曲目
    AVPlayerItem *playeritem = [[AVPlayerItem alloc]initWithURL:url];
    //创建播放器
    self.avplayer = [[AVPlayer alloc]initWithPlayerItem:playeritem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
