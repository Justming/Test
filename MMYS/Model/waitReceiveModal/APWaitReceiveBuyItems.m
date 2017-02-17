//
//  APWaitReceiveBuyItems.m
//
//  Created by   on 16/8/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APWaitReceiveBuyItems.h"
#import "APWaitReceiveSku.h"


NSString *const kAPWaitReceiveBuyItemsNumber = @"number";
NSString *const kAPWaitReceiveBuyItemsBuyType = @"buyType";
NSString *const kAPWaitReceiveBuyItemsSaledNumber = @"saledNumber";
NSString *const kAPWaitReceiveBuyItemsBuyPrice = @"buyPrice";
NSString *const kAPWaitReceiveBuyItemsDiedLine = @"diedLine";
NSString *const kAPWaitReceiveBuyItemsSku = @"sku";
NSString *const kAPWaitReceiveBuyItemsBackScore = @"backScore";
NSString *const kAPWaitReceiveBuyItemsOriginPrice = @"originPrice";
NSString *const kAPWaitReceiveBuyItemsBuyItemUuid = @"buyItemUuid";


@interface APWaitReceiveBuyItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APWaitReceiveBuyItems

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
            self.number = [[self objectOrNilForKey:kAPWaitReceiveBuyItemsNumber fromDictionary:dict] doubleValue];
            self.buyType = [self objectOrNilForKey:kAPWaitReceiveBuyItemsBuyType fromDictionary:dict];
            self.saledNumber = [[self objectOrNilForKey:kAPWaitReceiveBuyItemsSaledNumber fromDictionary:dict] doubleValue];
            self.buyPrice = [[self objectOrNilForKey:kAPWaitReceiveBuyItemsBuyPrice fromDictionary:dict] doubleValue];
            self.diedLine = [self objectOrNilForKey:kAPWaitReceiveBuyItemsDiedLine fromDictionary:dict];
            self.sku = [APWaitReceiveSku modelObjectWithDictionary:[dict objectForKey:kAPWaitReceiveBuyItemsSku]];
            self.backScore = [[self objectOrNilForKey:kAPWaitReceiveBuyItemsBackScore fromDictionary:dict] doubleValue];
            self.originPrice = [[self objectOrNilForKey:kAPWaitReceiveBuyItemsOriginPrice fromDictionary:dict] doubleValue];
            self.buyItemUuid = [self objectOrNilForKey:kAPWaitReceiveBuyItemsBuyItemUuid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.number] forKey:kAPWaitReceiveBuyItemsNumber];
    [mutableDict setValue:self.buyType forKey:kAPWaitReceiveBuyItemsBuyType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.saledNumber] forKey:kAPWaitReceiveBuyItemsSaledNumber];
    [mutableDict setValue:[NSNumber numberWithDouble:self.buyPrice] forKey:kAPWaitReceiveBuyItemsBuyPrice];
    [mutableDict setValue:self.diedLine forKey:kAPWaitReceiveBuyItemsDiedLine];
    [mutableDict setValue:[self.sku dictionaryRepresentation] forKey:kAPWaitReceiveBuyItemsSku];
    [mutableDict setValue:[NSNumber numberWithDouble:self.backScore] forKey:kAPWaitReceiveBuyItemsBackScore];
    [mutableDict setValue:[NSNumber numberWithDouble:self.originPrice] forKey:kAPWaitReceiveBuyItemsOriginPrice];
    [mutableDict setValue:self.buyItemUuid forKey:kAPWaitReceiveBuyItemsBuyItemUuid];

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

    self.number = [aDecoder decodeDoubleForKey:kAPWaitReceiveBuyItemsNumber];
    self.buyType = [aDecoder decodeObjectForKey:kAPWaitReceiveBuyItemsBuyType];
    self.saledNumber = [aDecoder decodeDoubleForKey:kAPWaitReceiveBuyItemsSaledNumber];
    self.buyPrice = [aDecoder decodeDoubleForKey:kAPWaitReceiveBuyItemsBuyPrice];
    self.diedLine = [aDecoder decodeObjectForKey:kAPWaitReceiveBuyItemsDiedLine];
    self.sku = [aDecoder decodeObjectForKey:kAPWaitReceiveBuyItemsSku];
    self.backScore = [aDecoder decodeDoubleForKey:kAPWaitReceiveBuyItemsBackScore];
    self.originPrice = [aDecoder decodeDoubleForKey:kAPWaitReceiveBuyItemsOriginPrice];
    self.buyItemUuid = [aDecoder decodeObjectForKey:kAPWaitReceiveBuyItemsBuyItemUuid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_number forKey:kAPWaitReceiveBuyItemsNumber];
    [aCoder encodeObject:_buyType forKey:kAPWaitReceiveBuyItemsBuyType];
    [aCoder encodeDouble:_saledNumber forKey:kAPWaitReceiveBuyItemsSaledNumber];
    [aCoder encodeDouble:_buyPrice forKey:kAPWaitReceiveBuyItemsBuyPrice];
    [aCoder encodeObject:_diedLine forKey:kAPWaitReceiveBuyItemsDiedLine];
    [aCoder encodeObject:_sku forKey:kAPWaitReceiveBuyItemsSku];
    [aCoder encodeDouble:_backScore forKey:kAPWaitReceiveBuyItemsBackScore];
    [aCoder encodeDouble:_originPrice forKey:kAPWaitReceiveBuyItemsOriginPrice];
    [aCoder encodeObject:_buyItemUuid forKey:kAPWaitReceiveBuyItemsBuyItemUuid];
}

- (id)copyWithZone:(NSZone *)zone
{
    APWaitReceiveBuyItems *copy = [[APWaitReceiveBuyItems alloc] init];
    
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
