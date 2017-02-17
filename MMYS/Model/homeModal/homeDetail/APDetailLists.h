//
//  APDetailLists.h
//
//  Created by   on 16/9/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface APDetailLists : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double goodsStock;
@property (nonatomic, strong) NSString *goodsSize;
@property (nonatomic, strong) NSString *goodsColor;
@property (nonatomic, strong) NSString *picture;
@property (nonatomic, assign) double goodsId;
@property (nonatomic, strong) NSString *skuUuid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
