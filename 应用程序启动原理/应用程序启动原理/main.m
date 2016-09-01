//
//  main.m
//  应用程序启动原理
//
//  Created by apple on 16/9/1.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        //第三个参数：设置应用程序对象的名称UIApplication或者它的子控件，如果是nil,默认是UIApplication
        //第四个参数：设置UIApplication代理名称
        //NSStringFromClass:将类名转成字符串
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}


/*
 1.执行main函数
 2.执行UIApplicationMain,创建UIApplication对象，并设置UIApplication它的代理
 3.开启了一个事件循环.（主运行循环，死循环：保证应用程序不退出）
 4.去加载info.plist(判断infp.plist当中有没有Main,如果有Main.storyBoard)
 5.应用程序启动完毕（通知代理应用程序启动完毕）
 */