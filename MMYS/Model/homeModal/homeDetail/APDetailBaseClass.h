//
//  APDetailBaseClass.h
//
//  Created by   on 16/9/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APDetailBody;

@interface APDetailBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) APDetailBody *body;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
