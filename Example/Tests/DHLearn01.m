//
//  DHLearn01.m
//  DHLearnRealm
//
//  Created by LDH on 16/5/22.
//  Copyright © 2017年 DHLau. All rights reserved.
//  简单数据操作

#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "DHStudent.h"
#import "DHStudent2.h"

@interface DHLearn01 : XCTestCase

@end

@implementation DHLearn01


- (void)testAdd {
    
    DHStudent *stu = [[DHStudent alloc] initWithValue:@{@"name":@"张三",@"num":@1}];
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    [realm addObject:stu];
    [realm commitWriteTransaction];
    
}

- (void)testAdd2 {
    DHStudent *stu = [[DHStudent alloc] initWithValue:@{@"name":@"李四",@"num":@2}];
    RLMRealm *rlm = [RLMRealm defaultRealm];
    
    [rlm transactionWithBlock:^{
        [rlm addObject:stu];
    }];
    
}

- (void)testUpdate {
    RLMResults *results = [DHStudent objectsWhere:@"name='张三'"];
    DHStudent *stu = results.firstObject;
    
    RLMRealm *rlm = [RLMRealm defaultRealm];
    [rlm transactionWithBlock:^{
        stu.num = 20;
    }];
}

- (void)testDelete
{
    // 删除所有
    RLMRealm *rlm = [RLMRealm defaultRealm];
    [rlm transactionWithBlock:^{
        [rlm deleteAllObjects];
    }];
    
    
    DHStudent2 *stu1 = [[DHStudent2 alloc] initWithValue:@{@"name":@"赵四",@"num":@3}];
    DHStudent2 *stu2 = [[DHStudent2 alloc] initWithValue:@{@"name":@"王五",@"num":@4}];
    [rlm transactionWithBlock:^{
        [rlm addObject:stu1];
        [rlm addObject:stu2];
    }];
    // 根据主键删除
    DHStudent2 *stu = [DHStudent2 objectInRealm:rlm forPrimaryKey:@3];
    [rlm transactionWithBlock:^{
        [rlm deleteObject:stu];
    }];
}

- (void)testQuery
{
    // 动态刷新RLMResults
    RLMResults *students = [DHStudent allObjects];
    NSLog(@"%@", students);
    
    DHStudent *stu = [[DHStudent alloc] initWithValue:@{@"name":@"张三",@"num":@1}];
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:stu];
    }];
    
    NSLog(@"%@", students);
}

- (void)testSort
{
    DHStudent2 *stu1 = [[DHStudent2 alloc] initWithValue:@{@"name":@"赵四",@"num":@5}];
    DHStudent2 *stu2 = [[DHStudent2 alloc] initWithValue:@{@"name":@"王五",@"num":@6}];
    DHStudent2 *stu3 = [[DHStudent2 alloc] initWithValue:@{@"name":@"王五",@"num":@7}];
    RLMRealm *rlm = [RLMRealm defaultRealm];
    [rlm transactionWithBlock:^{
        [rlm addObject:stu2];
        [rlm addObject:stu1];
        [rlm addObject:stu3];
    }];
    // 排序
    RLMResults<DHStudent *> *stus = [DHStudent objectsWhere:@"num > 5"];
    RLMResults<DHStudent *> *stus2 = [stus sortedResultsUsingKeyPath:@"name" ascending:NO];
    NSLog(@"%@", stus2);
}

@end
