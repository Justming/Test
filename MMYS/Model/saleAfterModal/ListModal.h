//
//  List.h
//
//  Created by   on 16/8/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SkuModal;

@interface ListModal : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *reason;
@property (nonatomic, strong) NSString *goodsUuid;
@property (nonatomic, strong) NSString *goodsName;
@property (nonatomic, strong) SkuModal *sku;
@property (nonatomic, assign) double price;
@property (nonatomic, strong) NSString *buyType;
@property (nonatomic, strong) NSString *returnStatus;
@property (nonatomic, assign) double totalMoney;
@property (nonatomic, assign) double refundNumber;
@property (nonatomic, strong) NSString *buyItemUuid;

@property (nonatomic, strong) NSString *returnOrderUuid;
@property (nonatomic, strong) NSString *waybillNumber;



+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
