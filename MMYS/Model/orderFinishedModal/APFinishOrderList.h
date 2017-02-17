//
//  APFinishOrderList.h
//
//  Created by   on 16/8/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APFinishBuyItems;

@interface APFinishOrderList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *goodsUuid;
@property (nonatomic, strong) APFinishBuyItems *buyItems;
@property (nonatomic, strong) NSString *goodsName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
