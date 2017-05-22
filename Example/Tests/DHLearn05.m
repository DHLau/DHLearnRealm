//
//  DHLearn05.m
//  DHLearnRealm
//
//  Created by LDH on 17/5/22.
//  Copyright © 2017年 DHLau. All rights reserved.
//  数据库操作

#import <XCTest/XCTest.h>
#import "DHData.h"

@interface DHLearn05 : XCTestCase

@end

@implementation DHLearn05


- (void)testExample {
    
    [self setDefaultRealmForUser:@"zhangsan"];
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    DHData *data = [[DHData alloc] init];
    data.name = @"abc";
    [realm transactionWithBlock:^{
        [realm addObject:data];
    }];
    
    
    [self setDefaultRealmForUser:@"lisi"];
    RLMRealm *realm2 = [RLMRealm defaultRealm];
    DHData *data2 = [[DHData alloc] init];
    data2.name = @"efg";
    [realm2 transactionWithBlock:^{
        [realm2 addObject:data2];
    }];
    
}

- (void)setDefaultRealmForUser:(NSString *)user
{
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.fileURL = [[[config.fileURL URLByDeletingLastPathComponent] URLByAppendingPathComponent:user] URLByAppendingPathExtension:@"realm"];
    [RLMRealmConfiguration setDefaultConfiguration:config];
}

- (void)testDelete{
    [self setDefaultRealmForUser:@"zhangsan"];
    NSFileManager *manager = [NSFileManager defaultManager];
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    NSArray<NSURL *> *realmFileURLs = @[config.fileURL,
                                        [config.fileURL URLByAppendingPathExtension:@"lock"],
                                        [config.fileURL URLByAppendingPathExtension:@"log_a"],
                                        [config.fileURL URLByAppendingPathExtension:@"log_b"],
                                        [config.fileURL URLByAppendingPathExtension:@"note"]];
    for (NSURL *url in realmFileURLs) {
        NSError *error = nil;
        [manager removeItemAtURL:url error:&error];
        if (error) {
            // deal
        }
    }
}

- (void)testReadOnly {
    RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
    config.readOnly = YES;
    [RLMRealmConfiguration setDefaultConfiguration:config];
}


@end
