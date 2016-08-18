//
//  main.m
//  KVC的使用
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 XinHuoYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JMPerson.h"
#import "JMDog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //去除数组中所有模型的某个属性
        JMPerson *person1 = [[JMPerson alloc]init];
        person1.name = @"asda";
        person1.money = 120;
        
        JMPerson *person2 = [[JMPerson alloc]init];
        person2.name = @"asda";
        person2.money = 22.0;
        
        JMPerson *person3 = [[JMPerson alloc]init];
        person3.name = @"zxc";
        person3.money = 123.99;
        NSArray *allPersons = @[person1,person2,person3];
        NSArray *personName = [allPersons valueForKeyPath:@"name"];
        NSLog(@"%@",personName);
        
   }
    return 0;
}

//把模型转成字典
void test5(){
    JMPerson *person = [[JMPerson alloc]init];
    person.name = @"yuanyi";
    person.money = 1000;
    
    NSDictionary *dict = [person dictionaryWithValuesForKeys:@[@"name",@"money"]];
    NSLog(@"%@",dict);
}

//取值
void test4(){
    JMPerson *person = [[JMPerson alloc]init];
    person.name = @"zhangsan";
    person.money = 100;
    //利用KVC取值
    NSLog(@"%@ --- %.2f",[person valueForKeyPath:@"name"],[[person valueForKeyPath:@"money"] floatValue]);
}

/*
 作用：字典转模型
 开发中是不建议使用setValuesForKeysWithDictionary；
 1.字典中的key必须在模型的属性中找到
 2.如果模型中带有模型，setValuesForKeysWithDictionary不还是
 应用场景：简单的字典转模型 -->框架(MJExtention)
 */
void test3(){
    NSDictionary *dict = @{
                           @"name":@"lurry",
                           @"money":@189.88,
                           @"dog":@{
                                   @"name":@"wangcai",
                                   @"price":@8
                                   },
                           @"books":@[
                                   @{@"name":@"ioskaifa",@"price":@1999},
                                   @{@"name":@"iosadad",@"price":@1919},
                                   @{@"name":@"iosada",@"price":@110}
                                   ]
                           };
    JMPerson *person = [[JMPerson alloc]initWithDict:dict];
    NSLog(@"%@",person.dog.class);
    [person setValue:@{
                       @"name":@"wangcai111",
                       @"price":@81
                       } forKeyPath:@"dog"];
}

/**
 *  利用KVC修改类的私有成员变了(UIPageControl)
 */
void test2(){
    JMPerson *person = [[JMPerson alloc]init];
    // person -> _age
    //利用KVC修改类的私有成员变量
    [person printAge];
    [person setValue:@"88" forKeyPath:@"_age"]; //age _age
    [person printAge];
}

/**
 *  利用KVC进行综合赋值
 */
void test1(){
    JMPerson *person = [[JMPerson alloc]init];
    person.dog = [[JMDog alloc]init];
    //        person.dog.name = @"ad";
    //KVC赋值
    /*
     forKey和forKeyPath
     1>forKeyPath 包含了所有forKey的功能
     2>forKeyPath进行内部的点语法
     */
    //        [person.dog setValue:@"ad" forKey:@"name"];
    [person setValue:@"ad" forKeyPath:@"dog.name"];
    NSLog(@"%@",person.dog.name);

}

/**
 *  利用KVC进行简单赋值
 */
void test(){
    JMPerson *person = [[JMPerson alloc]init];
    //常规复制
    //        person.name = @"sad";
    //        person.money = 100;
    //KVC赋值
    [person setValue:@"王五" forKey:@"name"];
    [person setValue:@"100" forKeyPath:@"money"];//自动类型转换
    
    NSLog(@"%@ ---- %.2f",person.name,person.money);

}