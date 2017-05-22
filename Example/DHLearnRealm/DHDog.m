//
//  DHDog.m
//  DHLearnRealm
//
//  Created by LDH on 17/5/22.
//  Copyright © 2017年 DHLau. All rights reserved.
//

#import "DHDog.h"

@implementation DHDog

// Specify default values for properties

+ (NSArray<NSString *> *)requiredProperties {
    return @[@"name"];
}

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"age":@1};
}

// Specify properties to ignore (Realm won't persist these)

+ (NSArray *)ignoredProperties
{
    return @[@"sonName"];
}

@end
