//
//  APFinishOrderList.m
//
//  Created by   on 16/8/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APFinishOrderList.h"
#import "APFinishBuyItems.h"


NSString *const kAPFinishOrderListGoodsUuid = @"goodsUuid";
NSString *const kAPFinishOrderListBuyItems = @"buyItems";
NSString *const kAPFinishOrderListGoodsName = @"goodsName";


@interface APFinishOrderList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APFinishOrderList

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
            self.goodsUuid = [self objectOrNilForKey:kAPFinishOrderListGoodsUuid fromDictionary:dict];
            self.buyItems = [APFinishBuyItems modelObjectWithDictionary:[dict objectForKey:kAPFinishOrderListBuyItems]];
            self.goodsName = [self objectOrNilForKey:kAPFinishOrderListGoodsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.goodsUuid forKey:kAPFinishOrderListGoodsUuid];
    [mutableDict setValue:[self.buyItems dictionaryRepresentation] forKey:kAPFinishOrderListBuyItems];
    [mutableDict setValue:self.goodsName forKey:kAPFinishOrderListGoodsName];

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

    self.goodsUuid = [aDecoder decodeObjectForKey:kAPFinishOrderListGoodsUuid];
    self.buyItems = [aDecoder decodeObjectForKey:kAPFinishOrderListBuyItems];
    self.goodsName = [aDecoder decodeObjectForKey:kAPFinishOrderListGoodsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_goodsUuid forKey:kAPFinishOrderListGoodsUuid];
    [aCoder encodeObject:_buyItems forKey:kAPFinishOrderListBuyItems];
    [aCoder encodeObject:_goodsName forKey:kAPFinishOrderListGoodsName];
}

- (id)copyWithZone:(NSZone *)zone
{
    APFinishOrderList *copy = [[APFinishOrderList alloc] init];
    
    if (copy) {

        copy.goodsUuid = [self.goodsUuid copyWithZone:zone];
        copy.buyItems = [self.buyItems copyWithZone:zone];
        copy.goodsName = [self.goodsName copyWithZone:zone];
    }
    
    return copy;
}


@end
