//
//  NSURL+url.m
//  RunTimeDemo
//
//  Created by 赵卫东 on 2017/5/4.
//  Copyright © 2017年 YFKJ. All rights reserved.
//

#import "NSURL+url.h"
#import <objc/message.h>


@implementation NSURL (url)

// 当某个类被加载的时候,调用这个方法
+ (void)load {
    
    // 1. 获取系统自带的方法
    Method urlWithString = class_getClassMethod([NSURL class], @selector(URLWithString:));
    // 2. 获取自己要交换的方法
    Method xj_urlWithString = class_getClassMethod([NSURL class], @selector(xj_urlWithString:));
    
    // 3. 交换上面两个方法
    method_exchangeImplementations(urlWithString, xj_urlWithString);
    
}

// 交换xj_urlWithString和系统的URLWithString方法
+ (instancetype)xj_urlWithString:(NSString *)urlstr {
    
    NSURL *url = [NSURL xj_urlWithString:urlstr];
    
    if (url == nil) {
        NSLog(@"url不能为空");
    }
    
    return url;
}


@end
