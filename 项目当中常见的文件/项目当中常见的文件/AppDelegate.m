//
//  AppDelegate.m
//  项目当中常见的文件
//
//  Created by apple on 16/9/1.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

/*
 Xcode5 与 Xcode7的区别
 1.Xcode5有个FrameWorks,存放数据
 Xcode7自动导入框架，用到森么框架时，自动倒入框架
 2.Xcode7当中多了一个LaunchScreen.storyboard,用来设置启动页面
   如果没有设置启动叶敏啊，默认他的屏幕大小是4s大小
   LaunchScreen底层实现：把LaunchScreen.storyboard当中内容，生成一张图片
 3. info.plist,名称发生了变化，而且放到了外面
 4.在Xcode7当中没有了PCH文件
 
 info.plist作用：设置应用程序的配置信息，它是一个字典
 Bundle name:应用程序它的名称
 Bundle identifier:应用程序的唯一标识
 Bundle versions string,short:版本号
 Bundle version:应用程序打包的版本号
 
 PCH作用：
 1.存入一些公有的宏
 2.导入公共的头文件
 3.自定义Log
 
 原理:工程在编译过程当中，把PCH文件当中的所有内容导入到工程当中所有文件当中。
 */


#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    JMLOG(@"asdsadad");
    JMLOG(@"asdsadad");
    JMLOG(@"asdsadad");JMLOG(@"asdsadad");
    JMLOG(@"asdsadad");
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
   
    JMLOG(@"asdsadad");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
