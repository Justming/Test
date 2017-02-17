//
//  APgoodsCarBuyItems.h
//
//  Created by   on 16/8/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APgoodsCarSku;

@interface APgoodsCarBuyItems : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double number;
@property (nonatomic, strong) NSString *purchaseCarUuid;
@property (nonatomic, assign) double originalPrice;
@property (nonatomic, strong) APgoodsCarSku *sku;
@property (nonatomic, strong) NSString *diedLine;
@property (nonatomic, assign) double transactionPrice;
@property (nonatomic, assign) double returnIntegralValue;

@property(nonatomic,assign)BOOL selected;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
