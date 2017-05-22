//
//  DHStudent3.m
//  DHLearnRealm
//
//  Created by LDH on 17/5/22.
//  Copyright © 2017年 DHLau. All rights reserved.
//

#import "DHStudent3.h"

@implementation DHStudent3

// Specify default values for properties

+ (NSString *)primaryKey
{
    return @"num";
}

- (UIImage *)image
{
    return [UIImage imageWithData:self.imageData];
}

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
