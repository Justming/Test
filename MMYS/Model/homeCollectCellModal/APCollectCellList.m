//
//  APCollectCellList.m
//
//  Created by   on 16/8/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APCollectCellList.h"


NSString *const kAPCollectCellListNumber = @"number";
NSString *const kAPCollectCellListGoodsUuid = @"goodsUuid";
NSString *const kAPCollectCellListSellBackScore = @"sellBackScore";
NSString *const kAPCollectCellListTheBuyoutPrice = @"theBuyoutPrice";
NSString *const kAPCollectCellListGoodsTitle = @"goodsTitle";
NSString *const kAPCollectCellListOriginalPrice = @"originalPrice";
NSString *const kAPCollectCellListDiscount = @"discount";
NSString *const kAPCollectCellListCover = @"cover";
NSString *const kAPCollectCellListDesp = @"desp";


@interface APCollectCellList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APCollectCellList

@synthesize number = _number;
@synthesize goodsUuid = _goodsUuid;
@synthesize sellBackScore = _sellBackScore;
@synthesize theBuyoutPrice = _theBuyoutPrice;
@synthesize goodsTitle = _goodsTitle;
@synthesize originalPrice = _originalPrice;
@synthesize discount = _discount;
@synthesize cover = _cover;
@synthesize desp = _desp;


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
            self.number = [[self objectOrNilForKey:kAPCollectCellListNumber fromDictionary:dict] doubleValue];
            self.goodsUuid = [self objectOrNilForKey:kAPCollectCellListGoodsUuid fromDictionary:dict];
            self.sellBackScore = [[self objectOrNilForKey:kAPCollectCellListSellBackScore fromDictionary:dict] doubleValue];
            self.theBuyoutPrice = [[self objectOrNilForKey:kAPCollectCellListTheBuyoutPrice fromDictionary:dict] doubleValue];
            self.goodsTitle = [self objectOrNilForKey:kAPCollectCellListGoodsTitle fromDictionary:dict];
            self.originalPrice = [[self objectOrNilForKey:kAPCollectCellListOriginalPrice fromDictionary:dict] doubleValue];
            self.discount = [[self objectOrNilForKey:kAPCollectCellListDiscount fromDictionary:dict] doubleValue];
            self.cover = [self objectOrNilForKey:kAPCollectCellListCover fromDictionary:dict];
            self.desp = [self objectOrNilForKey:kAPCollectCellListDesp fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.number] forKey:kAPCollectCellListNumber];
    [mutableDict setValue:self.goodsUuid forKey:kAPCollectCellListGoodsUuid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sellBackScore] forKey:kAPCollectCellListSellBackScore];
    [mutableDict setValue:[NSNumber numberWithDouble:self.theBuyoutPrice] forKey:kAPCollectCellListTheBuyoutPrice];
    [mutableDict setValue:self.goodsTitle forKey:kAPCollectCellListGoodsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.originalPrice] forKey:kAPCollectCellListOriginalPrice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.discount] forKey:kAPCollectCellListDiscount];
    [mutableDict setValue:self.cover forKey:kAPCollectCellListCover];
    [mutableDict setValue:self.desp forKey:kAPCollectCellListDesp];

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

    self.number = [aDecoder decodeDoubleForKey:kAPCollectCellListNumber];
    self.goodsUuid = [aDecoder decodeObjectForKey:kAPCollectCellListGoodsUuid];
    self.sellBackScore = [aDecoder decodeDoubleForKey:kAPCollectCellListSellBackScore];
    self.theBuyoutPrice = [aDecoder decodeDoubleForKey:kAPCollectCellListTheBuyoutPrice];
    self.goodsTitle = [aDecoder decodeObjectForKey:kAPCollectCellListGoodsTitle];
    self.originalPrice = [aDecoder decodeDoubleForKey:kAPCollectCellListOriginalPrice];
    self.discount = [aDecoder decodeDoubleForKey:kAPCollectCellListDiscount];
    self.cover = [aDecoder decodeObjectForKey:kAPCollectCellListCover];
    self.desp = [aDecoder decodeObjectForKey:kAPCollectCellListDesp];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_number forKey:kAPCollectCellListNumber];
    [aCoder encodeObject:_goodsUuid forKey:kAPCollectCellListGoodsUuid];
    [aCoder encodeDouble:_sellBackScore forKey:kAPCollectCellListSellBackScore];
    [aCoder encodeDouble:_theBuyoutPrice forKey:kAPCollectCellListTheBuyoutPrice];
    [aCoder encodeObject:_goodsTitle forKey:kAPCollectCellListGoodsTitle];
    [aCoder encodeDouble:_originalPrice forKey:kAPCollectCellListOriginalPrice];
    [aCoder encodeDouble:_discount forKey:kAPCollectCellListDiscount];
    [aCoder encodeObject:_cover forKey:kAPCollectCellListCover];
    [aCoder encodeObject:_desp forKey:kAPCollectCellListDesp];
}

- (id)copyWithZone:(NSZone *)zone
{
    APCollectCellList *copy = [[APCollectCellList alloc] init];
    
    if (copy) {

        copy.number = self.number;
        copy.goodsUuid = [self.goodsUuid copyWithZone:zone];
        copy.sellBackScore = self.sellBackScore;
        copy.theBuyoutPrice = self.theBuyoutPrice;
        copy.goodsTitle = [self.goodsTitle copyWithZone:zone];
        copy.originalPrice = self.originalPrice;
        copy.discount = self.discount;
        copy.cover = [self.cover copyWithZone:zone];
        copy.desp = [self.desp copyWithZone:zone];
    }
    
    return copy;
}


@end
