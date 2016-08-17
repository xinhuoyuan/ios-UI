//
//  main.m
//  plist文件回顾
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 数组
//        NSArray *names = @[@"fhaj",@"asdas",@"sadas",@"asda"];
//        BOOL flag = [names writeToFile:@"/Users/apple/Desktop/names.plist" atomically:YES];
        
//        NSDictionary *persons = @{
//                                  @"name":@"asd",
//                                  @"age":@18,
//                                  @"height":@1.88
//                                  };
//        BOOL flag1 = [persons writeToFile:@"/Users/apple/Desktop/persons.plist" atomically:YES];
//        NSArray *person = @[
//                            @{@"name":@"asdads",@"age":@112},
//                            @{@"name":@"yasdas",@"age":@121,@"friends":@[@"sa",@"sad"]}
//                            ];
//        BOOL flag1 = [person writeToFile:@"/Users/apple/Desktop/person.plist" atomically:YES];
//        if (flag) {
//            NSLog(@"写入成功");
//        }
        NSArray *dataArr = @[
                             @{@"name":@"单肩包", @"icon":@"danjianbao"},
                             @{@"name":@"钱包", @"icon":@"qianbao"},
                             @{@"name":@"链条包", @"icon":@"liantiaobao"},
                             @{@"name":@"手提包", @"icon":@"shoutibao"},
                             @{@"name":@"双肩包", @"icon":@"shuangjianbao"},
                             @{@"name":@"斜挎包", @"icon":@"xiekuabao"}
                             ];
        BOOL flag = [dataArr writeToFile:@"/Users/apple/Desktop/dataArr.plist" atomically:YES];
        if (flag) {
            NSLog(@"写入成功");
        }
        
//        NSArray *persons = [NSArray arrayWithContentsOfFile:@"/Users/apple/Desktop/persons.plist"];
//        NSLog(@"%@",persons);
        
    }
    return 0;
}
