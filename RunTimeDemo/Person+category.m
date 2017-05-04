//
//  Person+category.m
//  RunTimeDemo
//
//  Created by 赵卫东 on 2017/5/4.
//  Copyright © 2017年 YFKJ. All rights reserved.
//

#import "Person+category.h"
#import <objc/runtime.h>

static void *strKey = &strKey;


@implementation Person (category)

-(void)setStr:(NSString *)str
{
    objc_setAssociatedObject(self, & strKey, str, OBJC_ASSOCIATION_COPY);
}

-(NSString *)str
{
    return objc_getAssociatedObject(self, &strKey);
}




@end
