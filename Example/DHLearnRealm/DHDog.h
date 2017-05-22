//
//  DHDog.h
//  DHLearnRealm
//
//  Created by LDH on 17/5/22.
//  Copyright © 2017年 DHLau. All rights reserved.
//

#import <Realm/Realm.h>

@interface DHDog : RLMObject
@property NSString *name;
@property int age;
@property NSString *action;
@property NSString *sonName;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<DHDog *><DHDog>
RLM_ARRAY_TYPE(DHDog)
