//
//  DHNoticeModel.h
//  DHLearnRealm
//
//  Created by LDH on 17/5/22.
//  Copyright © 2017年 DHLau. All rights reserved.
//

#import <Realm/Realm.h>

@interface DHNoticeModel : RLMObject
@property NSString *name;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<DHNoticeModel *><DHNoticeModel>
RLM_ARRAY_TYPE(DHNoticeModel)
