//
//  APWaitReceiveBuyItems.h
//
//  Created by   on 16/8/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APWaitReceiveSku;

@interface APWaitReceiveBuyItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double number;
@property (nonatomic, strong) NSString *buyType;
@property (nonatomic, assign) double saledNumber;
@property (nonatomic, assign) double buyPrice;
@property (nonatomic, strong) NSString *diedLine;
@property (nonatomic, strong) APWaitReceiveSku *sku;
@property (nonatomic, assign) double backScore;
@property (nonatomic, assign) double originPrice;
@property (nonatomic, strong) NSString *buyItemUuid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
