//
//  DHLearn04.m
//  DHLearnRealm
//
//  Created by LDH on 17/5/22.
//  Copyright © 2017年 DHLau. All rights reserved.
//  通知

#import <XCTest/XCTest.h>
#import "DHNoticeModel.h"

@interface DHLearn04 : XCTestCase

@property (nonatomic, strong) RLMNotificationToken *token;

@end

@implementation DHLearn04

- (void)setUp {
    [super setUp];
    
    
    RLMRealm *rlm = [RLMRealm defaultRealm];
    self.token = [rlm addNotificationBlock:^(RLMNotification  _Nonnull notification, RLMRealm * _Nonnull realm) {
        NSLog(@"监听到修改通知");
    }];
    
}

- (void)tearDown {
    
    [self.token stop];
    
    [super tearDown];
}

- (void)testExample {
    
    DHNoticeModel *noticeM = [[DHNoticeModel alloc] init];
    noticeM.name = @"王二小";
    
    RLMRealm *rlm = [RLMRealm defaultRealm];
    [rlm transactionWithBlock:^{
        [rlm addObject:noticeM];
    }];

}

@end
