//
//  APWaitReceiveBaseClass.h
//
//  Created by   on 16/8/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APWaitReceiveBody;

@interface APWaitReceiveBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) APWaitReceiveBody *body;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
