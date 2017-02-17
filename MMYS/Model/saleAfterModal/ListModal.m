//
//  List.m
//
//  Created by   on 16/8/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ListModal.h"
#import "SkuModal.h"


NSString *const kListReason = @"reason";
NSString *const kListGoodsUuid = @"goodsUuid";
NSString *const kListGoodsName = @"goodsName";
NSString *const kListSku = @"sku";
NSString *const kListPrice = @"price";
NSString *const kListBuyType = @"buyType";
NSString *const kListReturnStatus = @"returnStatus";
NSString *const kListTotalMoney = @"totalMoney";
NSString *const kListRefundNumber = @"refundNumber";
NSString *const kListBuyItemUuid = @"buyItemUuid";

NSString *const kListReturnOrderUuid = @"returnOrderUuid";
NSString *const kListWaybillNumber = @"waybill_number";


@interface ListModal ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ListModal

@synthesize reason = _reason;
@synthesize goodsUuid = _goodsUuid;
@synthesize goodsName = _goodsName;
@synthesize sku = _sku;
@synthesize price = _price;
@synthesize buyType = _buyType;
@synthesize returnStatus = _returnStatus;
@synthesize totalMoney = _totalMoney;
@synthesize refundNumber = _refundNumber;
@synthesize buyItemUuid = _buyItemUuid;
@synthesize returnOrderUuid = _returnOrderUuid;
@synthesize waybillNumber = _waybillNumber;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.reason = [self objectOrNilForKey:kListReason fromDictionary:dict];
            self.goodsUuid = [self objectOrNilForKey:kListGoodsUuid fromDictionary:dict];
            self.goodsName = [self objectOrNilForKey:kListGoodsName fromDictionary:dict];
            self.sku = [SkuModal modelObjectWithDictionary:[dict objectForKey:kListSku]];
            self.price = [[self objectOrNilForKey:kListPrice fromDictionary:dict] doubleValue];
            self.buyType = [self objectOrNilForKey:kListBuyType fromDictionary:dict];
            self.returnStatus = [self objectOrNilForKey:kListReturnStatus fromDictionary:dict];
            self.totalMoney = [[self objectOrNilForKey:kListTotalMoney fromDictionary:dict] doubleValue];
            self.refundNumber = [[self objectOrNilForKey:kListRefundNumber fromDictionary:dict] doubleValue];
            self.buyItemUuid = [self objectOrNilForKey:kListBuyItemUuid fromDictionary:dict];
            self.returnOrderUuid = [self objectOrNilForKey:kListReturnOrderUuid fromDictionary:dict];
            self.waybillNumber = [self objectOrNilForKey:kListWaybillNumber fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.reason forKey:kListReason];
    [mutableDict setValue:self.goodsUuid forKey:kListGoodsUuid];
    [mutableDict setValue:self.goodsName forKey:kListGoodsName];
    [mutableDict setValue:[self.sku dictionaryRepresentation] forKey:kListSku];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kListPrice];
    [mutableDict setValue:self.buyType forKey:kListBuyType];
    [mutableDict setValue:self.returnStatus forKey:kListReturnStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalMoney] forKey:kListTotalMoney];
    [mutableDict setValue:[NSNumber numberWithDouble:self.refundNumber] forKey:kListRefundNumber];
    [mutableDict setValue:self.buyItemUuid forKey:kListBuyItemUuid];

    [mutableDict setValue:self.returnOrderUuid forKey:kListReturnOrderUuid];
    [mutableDict setValue:self.waybillNumber forKey:kListWaybillNumber];
    
    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.reason = [aDecoder decodeObjectForKey:kListReason];
    self.goodsUuid = [aDecoder decodeObjectForKey:kListGoodsUuid];
    self.goodsName = [aDecoder decodeObjectForKey:kListGoodsName];
    self.sku = [aDecoder decodeObjectForKey:kListSku];
    self.price = [aDecoder decodeDoubleForKey:kListPrice];
    self.buyType = [aDecoder decodeObjectForKey:kListBuyType];
    self.returnStatus = [aDecoder decodeObjectForKey:kListReturnStatus];
    self.totalMoney = [aDecoder decodeDoubleForKey:kListTotalMoney];
    self.refundNumber = [aDecoder decodeDoubleForKey:kListRefundNumber];
    self.buyItemUuid = [aDecoder decodeObjectForKey:kListBuyItemUuid];
    
    self.returnOrderUuid = [aDecoder decodeObjectForKey:kListReturnOrderUuid];
    self.waybillNumber = [aDecoder decodeObjectForKey:kListWaybillNumber];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_reason forKey:kListReason];
    [aCoder encodeObject:_goodsUuid forKey:kListGoodsUuid];
    [aCoder encodeObject:_goodsName forKey:kListGoodsName];
    [aCoder encodeObject:_sku forKey:kListSku];
    [aCoder encodeDouble:_price forKey:kListPrice];
    [aCoder encodeObject:_buyType forKey:kListBuyType];
    [aCoder encodeObject:_returnStatus forKey:kListReturnStatus];
    [aCoder encodeDouble:_totalMoney forKey:kListTotalMoney];
    [aCoder encodeDouble:_refundNumber forKey:kListRefundNumber];
    [aCoder encodeObject:_buyItemUuid forKey:kListBuyItemUuid];
    
    [aCoder encodeObject:_returnOrderUuid forKey:kListReturnOrderUuid];
    [aCoder encodeObject:_waybillNumber forKey:kListWaybillNumber];
}

- (id)copyWithZone:(NSZone *)zone
{
    ListModal *copy = [[ListModal alloc] init];
    
    if (copy) {

        copy.reason = [self.reason copyWithZone:zone];
        copy.goodsUuid = [self.goodsUuid copyWithZone:zone];
        copy.goodsName = [self.goodsName copyWithZone:zone];
        copy.sku = [self.sku copyWithZone:zone];
        copy.price = self.price;
        copy.buyType = [self.buyType copyWithZone:zone];
        copy.returnStatus = [self.returnStatus copyWithZone:zone];
        copy.totalMoney = self.totalMoney;
        copy.refundNumber = self.refundNumber;
        copy.buyItemUuid = [self.buyItemUuid copyWithZone:zone];
        
        copy.returnOrderUuid = [self.returnOrderUuid copyWithZone:zone];
        copy.waybillNumber = [self.waybillNumber copyWithZone:zone];
    }
    
    return copy;
}


@end
