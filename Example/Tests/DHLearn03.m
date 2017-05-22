//
//  DHLearn03.m
//  DHLearnRealm
//
//  Created by LDH on 17/5/22.
//  Copyright © 2017年 DHLau. All rights reserved.
//  可空属性、默认值、忽略属性

#import <XCTest/XCTest.h>
#import "DHDog.h"

@interface DHLearn03 : XCTestCase

@end

@implementation DHLearn03

- (void)testExample {

    DHDog *dog = [[DHDog alloc] init];
    dog.name = @"旺财";
    dog.action = @"eat";
    
    RLMRealm *rlm = [RLMRealm defaultRealm];
    [rlm transactionWithBlock:^{
        [rlm addObject:dog];
    }];
    
}

@end
