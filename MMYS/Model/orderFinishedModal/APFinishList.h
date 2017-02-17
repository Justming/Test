//
//  APFinishList.h
//
//  Created by   on 16/8/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface APFinishList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *orderUuid;
@property (nonatomic, strong) NSString *orderNumber;
@property (nonatomic, strong) NSArray *orderList;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
