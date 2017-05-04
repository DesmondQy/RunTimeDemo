//
//  Person.m
//  RunTimeDemo
//
//  Created by 赵卫东 on 2017/5/4.
//  Copyright © 2017年 YFKJ. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>


@implementation Person
{
    int _age;
    double _height;
    NSString *_name;
}

- (void)test
{
    NSLog(@"%s", __func__);
}

- (void)demo
{
    NSLog(@"%s", __func__);
}


- (void)encodeWithCoder:(NSCoder *)encoder
{
    unsigned int count = 0;
    // 1.取出所有的属性
    objc_property_t *propertes = class_copyPropertyList([self class], &count);
    // 2.遍历所有的属性
    for (int i = 0; i < count; i++) {
        // 获取当前遍历到的属性名称
        const char *propertyName = property_getName(propertes[i]);
        NSString *name = [NSString stringWithUTF8String:propertyName];
        // 利用KVC取出对应属性的值
        id value = [self valueForKey:name];
        // 归档到文件中
        [encoder encodeObject:value forKey:name];
    }
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        unsigned int count = 0;
        // 1.取出所有的属性
        objc_property_t *propertes = class_copyPropertyList([self class], &count);
        // 2.遍历所有的属性
        for (int i = 0; i < count; i++) {
            // 获取当前遍历到的属性名称
            const char *propertyName = property_getName(propertes[i]);
            NSString *name = [NSString stringWithUTF8String:propertyName];
            // 解归档当前遍历到得属性的值
            id value = [decoder decodeObjectForKey:name];
            //            self.className = [decoder decodeObjectForKey:@"className"];
            // 利用KVC给属性设值
            [self setValue:value forKey:name];
        }
    }
    return self;
}


@end
