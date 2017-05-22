//
//  DHLearn02.m
//  DHLearnRealm
//
//  Created by LDH on 17/5/22.
//  Copyright © 2017年 DHLau. All rights reserved.
//  支持的数据类型

#import <XCTest/XCTest.h>
#import "DHStudent3.h"
@interface DHLearn02 : XCTestCase

@end

@implementation DHLearn02

- (void)testExample {
    
    // 支持的数据类型包括
    // BOOL, bool, int, NSInteger, long, long long, float, double, NSString, NSDate, NSData, and NSNumber
    // 不支持集合类型
    
    DHStudent3 *student = [[DHStudent3 alloc] init];
    student.name = @"张三";
    student.num = 1;
    
    DHPen *pen1 = [[DHPen alloc] initWithValue:@{@"name":@"圆珠笔"}];
    DHPen *pen2 = [[DHPen alloc] initWithValue:@{@"name":@"铅笔"}];
    [student.pens addObject:pen1];
    [student.pens addObject:pen2];
    
    // 存储图片
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"IMG_3044.JPG" ofType:@""];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    student.imageData = data;
    
    RLMRealm *rlm = [RLMRealm defaultRealm];
    [rlm transactionWithBlock:^{
        [rlm addObject:student];
    }];
    
    
    
}

@end
