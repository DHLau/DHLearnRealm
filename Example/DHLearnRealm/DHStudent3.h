//
//  DHStudent3.h
//  DHLearnRealm
//
//  Created by LDH on 17/5/22.
//  Copyright © 2017年 DHLau. All rights reserved.
//

#import <Realm/Realm.h>
#import "DHPen.h"

@interface DHStudent3 : RLMObject

@property int num;
@property NSString *name;
// 加上readonly、realm 会自动忽略这个属性
@property (readonly) UIImage *image;
@property NSData *imageData;

// 数组要用这种形式
@property RLMArray<DHPen *> <DHPen>*pens;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<DHStudent3 *><DHStudent3>
RLM_ARRAY_TYPE(DHStudent3)
