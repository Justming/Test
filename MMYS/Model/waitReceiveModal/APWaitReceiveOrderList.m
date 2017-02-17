//
//  APWaitReceiveOrderList.m
//
//  Created by   on 16/8/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APWaitReceiveOrderList.h"
#import "APWaitReceiveBuyItems.h"


NSString *const kAPWaitReceiveOrderListGoodsUuid = @"goodsUuid";
NSString *const kAPWaitReceiveOrderListBuyItems = @"buyItems";
NSString *const kAPWaitReceiveOrderListGoodsName = @"goodsName";


@interface APWaitReceiveOrderList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APWaitReceiveOrderList

@synthesize goodsUuid = _goodsUuid;
@synthesize buyItems = _buyItems;
@synthesize goodsName = _goodsName;


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
            self.goodsUuid = [self objectOrNilForKey:kAPWaitReceiveOrderListGoodsUuid fromDictionary:dict];
            self.buyItems = [APWaitReceiveBuyItems modelObjectWithDictionary:[dict objectForKey:kAPWaitReceiveOrderListBuyItems]];
            self.goodsName = [self objectOrNilForKey:kAPWaitReceiveOrderListGoodsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.goodsUuid forKey:kAPWaitReceiveOrderListGoodsUuid];
    [mutableDict setValue:[self.buyItems dictionaryRepresentation] forKey:kAPWaitReceiveOrderListBuyItems];
    [mutableDict setValue:self.goodsName forKey:kAPWaitReceiveOrderListGoodsName];

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

    self.goodsUuid = [aDecoder decodeObjectForKey:kAPWaitReceiveOrderListGoodsUuid];
    self.buyItems = [aDecoder decodeObjectForKey:kAPWaitReceiveOrderListBuyItems];
    self.goodsName = [aDecoder decodeObjectForKey:kAPWaitReceiveOrderListGoodsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_goodsUuid forKey:kAPWaitReceiveOrderListGoodsUuid];
    [aCoder encodeObject:_buyItems forKey:kAPWaitReceiveOrderListBuyItems];
    [aCoder encodeObject:_goodsName forKey:kAPWaitReceiveOrderListGoodsName];
}

- (id)copyWithZone:(NSZone *)zone
{
    APWaitReceiveOrderList *copy = [[APWaitReceiveOrderList alloc] init];
    
    if (copy) {

        copy.goodsUuid = [self.goodsUuid copyWithZone:zone];
        copy.buyItems = [self.buyItems copyWithZone:zone];
        copy.goodsName = [self.goodsName copyWithZone:zone];
    }
    
    return copy;
}


@end
