//
//  APFinishBuyItems.m
//
//  Created by   on 16/8/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APFinishBuyItems.h"
#import "APFinishSku.h"


NSString *const kAPFinishBuyItemsNumber = @"number";
NSString *const kAPFinishBuyItemsBuyType = @"buyType";
NSString *const kAPFinishBuyItemsSaledNumber = @"saledNumber";
NSString *const kAPFinishBuyItemsBuyPrice = @"buyPrice";
NSString *const kAPFinishBuyItemsDiedLine = @"diedLine";
NSString *const kAPFinishBuyItemsSku = @"sku";
NSString *const kAPFinishBuyItemsBackScore = @"backScore";
NSString *const kAPFinishBuyItemsOriginPrice = @"originPrice";
NSString *const kAPFinishBuyItemsBuyItemUuid = @"buyItemUuid";


@interface APFinishBuyItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APFinishBuyItems

@synthesize number = _number;
@synthesize buyType = _buyType;
@synthesize saledNumber = _saledNumber;
@synthesize buyPrice = _buyPrice;
@synthesize diedLine = _diedLine;
@synthesize sku = _sku;
@synthesize backScore = _backScore;
@synthesize originPrice = _originPrice;
@synthesize buyItemUuid = _buyItemUuid;


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
            self.number = [[self objectOrNilForKey:kAPFinishBuyItemsNumber fromDictionary:dict] doubleValue];
            self.buyType = [self objectOrNilForKey:kAPFinishBuyItemsBuyType fromDictionary:dict];
            self.saledNumber = [[self objectOrNilForKey:kAPFinishBuyItemsSaledNumber fromDictionary:dict] doubleValue];
            self.buyPrice = [[self objectOrNilForKey:kAPFinishBuyItemsBuyPrice fromDictionary:dict] doubleValue];
            self.diedLine = [self objectOrNilForKey:kAPFinishBuyItemsDiedLine fromDictionary:dict];
            self.sku = [APFinishSku modelObjectWithDictionary:[dict objectForKey:kAPFinishBuyItemsSku]];
            self.backScore = [[self objectOrNilForKey:kAPFinishBuyItemsBackScore fromDictionary:dict] doubleValue];
            self.originPrice = [[self objectOrNilForKey:kAPFinishBuyItemsOriginPrice fromDictionary:dict] doubleValue];
            self.buyItemUuid = [self objectOrNilForKey:kAPFinishBuyItemsBuyItemUuid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.number] forKey:kAPFinishBuyItemsNumber];
    [mutableDict setValue:self.buyType forKey:kAPFinishBuyItemsBuyType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.saledNumber] forKey:kAPFinishBuyItemsSaledNumber];
    [mutableDict setValue:[NSNumber numberWithDouble:self.buyPrice] forKey:kAPFinishBuyItemsBuyPrice];
    [mutableDict setValue:self.diedLine forKey:kAPFinishBuyItemsDiedLine];
    [mutableDict setValue:[self.sku dictionaryRepresentation] forKey:kAPFinishBuyItemsSku];
    [mutableDict setValue:[NSNumber numberWithDouble:self.backScore] forKey:kAPFinishBuyItemsBackScore];
    [mutableDict setValue:[NSNumber numberWithDouble:self.originPrice] forKey:kAPFinishBuyItemsOriginPrice];
    [mutableDict setValue:self.buyItemUuid forKey:kAPFinishBuyItemsBuyItemUuid];

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

    self.number = [aDecoder decodeDoubleForKey:kAPFinishBuyItemsNumber];
    self.buyType = [aDecoder decodeObjectForKey:kAPFinishBuyItemsBuyType];
    self.saledNumber = [aDecoder decodeDoubleForKey:kAPFinishBuyItemsSaledNumber];
    self.buyPrice = [aDecoder decodeDoubleForKey:kAPFinishBuyItemsBuyPrice];
    self.diedLine = [aDecoder decodeObjectForKey:kAPFinishBuyItemsDiedLine];
    self.sku = [aDecoder decodeObjectForKey:kAPFinishBuyItemsSku];
    self.backScore = [aDecoder decodeDoubleForKey:kAPFinishBuyItemsBackScore];
    self.originPrice = [aDecoder decodeDoubleForKey:kAPFinishBuyItemsOriginPrice];
    self.buyItemUuid = [aDecoder decodeObjectForKey:kAPFinishBuyItemsBuyItemUuid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_number forKey:kAPFinishBuyItemsNumber];
    [aCoder encodeObject:_buyType forKey:kAPFinishBuyItemsBuyType];
    [aCoder encodeDouble:_saledNumber forKey:kAPFinishBuyItemsSaledNumber];
    [aCoder encodeDouble:_buyPrice forKey:kAPFinishBuyItemsBuyPrice];
    [aCoder encodeObject:_diedLine forKey:kAPFinishBuyItemsDiedLine];
    [aCoder encodeObject:_sku forKey:kAPFinishBuyItemsSku];
    [aCoder encodeDouble:_backScore forKey:kAPFinishBuyItemsBackScore];
    [aCoder encodeDouble:_originPrice forKey:kAPFinishBuyItemsOriginPrice];
    [aCoder encodeObject:_buyItemUuid forKey:kAPFinishBuyItemsBuyItemUuid];
}

- (id)copyWithZone:(NSZone *)zone
{
    APFinishBuyItems *copy = [[APFinishBuyItems alloc] init];
    
    if (copy) {

        copy.number = self.number;
        copy.buyType = [self.buyType copyWithZone:zone];
        copy.saledNumber = self.saledNumber;
        copy.buyPrice = self.buyPrice;
        copy.diedLine = [self.diedLine copyWithZone:zone];
        copy.sku = [self.sku copyWithZone:zone];
        copy.backScore = self.backScore;
        copy.originPrice = self.originPrice;
        copy.buyItemUuid = [self.buyItemUuid copyWithZone:zone];
    }
    
    return copy;
}


@end
