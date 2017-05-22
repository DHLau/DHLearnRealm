//
//  DHStudent.h
//  DHLearnRealm
//
//  Created by LDH on 17/5/22.
//  Copyright © 2017年 DHLau. All rights reserved.
//

#import <Realm/Realm.h>

@interface DHStudent : RLMObject
@property NSString *name;
@property int num;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<DHStudent *><DHStudent>
RLM_ARRAY_TYPE(DHStudent)
