//
//  APgoodsCarBuyItems.m
//
//  Created by   on 16/8/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APgoodsCarBuyItems.h"
#import "APgoodsCarSku.h"


NSString *const kAPgoodsCarBuyItemsNumber = @"number";
NSString *const kAPgoodsCarBuyItemsPurchaseCarUuid = @"purchase_car_uuid";
NSString *const kAPgoodsCarBuyItemsOriginalPrice = @"original_price";
NSString *const kAPgoodsCarBuyItemsSku = @"sku";
NSString *const kAPgoodsCarBuyItemsDiedLine = @"diedLine";
NSString *const kAPgoodsCarBuyItemsTransactionPrice = @"transaction_price";
NSString *const kAPgoodsCarBuyItemsReturnIntegralValue = @"return_integral_value";

@interface APgoodsCarBuyItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APgoodsCarBuyItems

@synthesize number = _number;
@synthesize purchaseCarUuid = _purchaseCarUuid;
@synthesize originalPrice = _originalPrice;
@synthesize sku = _sku;
@synthesize diedLine = _diedLine;
@synthesize transactionPrice = _transactionPrice;
@synthesize returnIntegralValue = _returnIntegralValue;

@synthesize selected = _selected;


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
            self.number = [[self objectOrNilForKey:kAPgoodsCarBuyItemsNumber fromDictionary:dict] doubleValue];
            self.purchaseCarUuid = [self objectOrNilForKey:kAPgoodsCarBuyItemsPurchaseCarUuid fromDictionary:dict];
            self.originalPrice = [[self objectOrNilForKey:kAPgoodsCarBuyItemsOriginalPrice fromDictionary:dict] doubleValue];
            self.sku = [APgoodsCarSku modelObjectWithDictionary:[dict objectForKey:kAPgoodsCarBuyItemsSku]];
            self.diedLine = [self objectOrNilForKey:kAPgoodsCarBuyItemsDiedLine fromDictionary:dict];
            self.transactionPrice = [[self objectOrNilForKey:kAPgoodsCarBuyItemsTransactionPrice fromDictionary:dict] doubleValue];
            self.returnIntegralValue = [[self objectOrNilForKey:kAPgoodsCarBuyItemsReturnIntegralValue fromDictionary:dict] doubleValue];

            self.selected=YES;
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.number] forKey:kAPgoodsCarBuyItemsNumber];
    [mutableDict setValue:self.purchaseCarUuid forKey:kAPgoodsCarBuyItemsPurchaseCarUuid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.originalPrice] forKey:kAPgoodsCarBuyItemsOriginalPrice];
    [mutableDict setValue:[self.sku dictionaryRepresentation] forKey:kAPgoodsCarBuyItemsSku];
    [mutableDict setValue:self.diedLine forKey:kAPgoodsCarBuyItemsDiedLine];
    [mutableDict setValue:[NSNumber numberWithDouble:self.transactionPrice] forKey:kAPgoodsCarBuyItemsTransactionPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.returnIntegralValue] forKey:kAPgoodsCarBuyItemsReturnIntegralValue];

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
    self.number = [aDecoder decodeDoubleForKey:kAPgoodsCarBuyItemsNumber];
    self.purchaseCarUuid = [aDecoder decodeObjectForKey:kAPgoodsCarBuyItemsPurchaseCarUuid];
    self.originalPrice = [aDecoder decodeDoubleForKey:kAPgoodsCarBuyItemsOriginalPrice];
    self.sku = [aDecoder decodeObjectForKey:kAPgoodsCarBuyItemsSku];
    self.diedLine = [aDecoder decodeObjectForKey:kAPgoodsCarBuyItemsDiedLine];
    self.transactionPrice = [aDecoder decodeDoubleForKey:kAPgoodsCarBuyItemsTransactionPrice];
    self.returnIntegralValue = [aDecoder decodeDoubleForKey:kAPgoodsCarBuyItemsReturnIntegralValue];
    
    self.selected=YES;
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeDouble:_number forKey:kAPgoodsCarBuyItemsNumber];
    [aCoder encodeObject:_purchaseCarUuid forKey:kAPgoodsCarBuyItemsPurchaseCarUuid];
    [aCoder encodeDouble:_originalPrice forKey:kAPgoodsCarBuyItemsOriginalPrice];
    [aCoder encodeObject:_sku forKey:kAPgoodsCarBuyItemsSku];
    [aCoder encodeObject:_diedLine forKey:kAPgoodsCarBuyItemsDiedLine];
    [aCoder encodeDouble:_transactionPrice forKey:kAPgoodsCarBuyItemsTransactionPrice];
    [aCoder encodeDouble:_returnIntegralValue forKey:kAPgoodsCarBuyItemsReturnIntegralValue];
     self.selected=YES;
}

- (id)copyWithZone:(NSZone *)zone
{
    APgoodsCarBuyItems *copy = [[APgoodsCarBuyItems alloc] init];
    
    if (copy) {

        copy.number = self.number;
        copy.purchaseCarUuid = [self.purchaseCarUuid copyWithZone:zone];
        copy.originalPrice = self.originalPrice;
        copy.sku = [self.sku copyWithZone:zone];
        copy.diedLine = [self.diedLine copyWithZone:zone];
        copy.transactionPrice = self.transactionPrice;
        copy.returnIntegralValue = self.returnIntegralValue;
        
        copy.selected=self.selected;
    }
    
    return copy;
}


@end
