//
//  DHStudent2.h
//  DHLearnRealm
//
//  Created by LDH on 17/5/22.
//  Copyright © 2017年 DHLau. All rights reserved.
//  有主键

#import <Realm/Realm.h>

@interface DHStudent2 : RLMObject
@property NSString *name;
@property int num;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<DHStudent2 *><DHStudent2>
RLM_ARRAY_TYPE(DHStudent2)
