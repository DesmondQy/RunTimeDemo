//
//  Person.h
//  RunTimeDemo
//
//  Created by 赵卫东 on 2017/5/4.
//  Copyright © 2017年 YFKJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSArray *picUrls;
@property (nonatomic, copy) NSString *className;
@property (nonatomic, assign) float score;
@property (nonatomic, strong) NSNumber *number;
- (void)demo;

@end
