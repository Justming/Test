//
//  APCashList.h
//
//  Created by   on 16/9/13
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface APCashList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *amount;
@property (nonatomic, strong) NSString *withdrawalsUuid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *datetime;
@property (nonatomic, strong) NSString *merchantsPayTreasure;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
