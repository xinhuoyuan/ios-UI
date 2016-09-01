//
//  AppDelegate.m
//  UIApplication代理(熟悉)
//
//  Created by apple on 16/9/1.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

/*
 移动操作系统都有个致命的缺点：
 所有的移动操作系统都有个致命的缺点：app很容易受到打扰
 比如一个来电或者锁屏会导致app进入后台，甚至被中指
 还有很多其他类似的情况会导致app收到干扰，在app收到干扰时，会产生一些系统事件
 这时UIApplication会通知它的delegate对象，让delegate代理来处理这些系统事件
 
 delagate可处理的时间
 应用程序的生命周期事件（如程序启动和关闭）
 系统事件(如来电)
 内存警告
 ...
 
 UIApplication代理
 UIApplication会在程序一起动时候创建一个遵守UIApplicationDelegate代理
 这个就是我们程序一创建时的AppDelegate类，AppDelegate就是遵守了UIApplicationDelegate协议
 在这个类中定义了了很多监听系统事件的方法，同时也定义了一些应用程序的生命周期方法
 
 UIApplication代理方法如下

 */

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//应用程序启动完毕时调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    NSLog(@"%s",__func__);
    return YES;
}
//应用程序将要失去焦点时调用
- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

//应用程序进入后台时调用
- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%s",__func__);
}
//应用程序进入前台时调用
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%s",__func__);
}
//应用程序获取焦点
//焦点：能否与用户进行交互
- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%s",__func__);
}
//的那个用户推出的时候调用
- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%s",__func__);
}
//当应用程序收到内存警告时调用
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    //清理缓存。图片。视频
    NSLog(@"%s",__func__);
}

@end
