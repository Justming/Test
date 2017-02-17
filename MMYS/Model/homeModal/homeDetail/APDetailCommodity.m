//
//  APDetailCommodity.m
//
//  Created by   on 16/9/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APDetailCommodity.h"


NSString *const kAPDetailCommodityTheBuyoutPrice = @"theBuyoutPrice";
NSString *const kAPDetailCommodityGoodsUuid = @"goodsUuid";
NSString *const kAPDetailCommodityOriginalPrice = @"originalPrice";
NSString *const kAPDetailCommodityTextForDetails = @"textForDetails";
NSString *const kAPDetailCommodityGoodsTitle = @"goodsTitle";
NSString *const kAPDetailCommodityCarouselFigure = @"carouselFigure";
NSString *const kAPDetailCommodityDesp = @"desp";
NSString *const kAPDetailCommodityConsignmentPrice = @"consignmentPrice";


@interface APDetailCommodity ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APDetailCommodity

@synthesize theBuyoutPrice = _theBuyoutPrice;
@synthesize goodsUuid = _goodsUuid;
@synthesize originalPrice = _originalPrice;
@synthesize textForDetails = _textForDetails;
@synthesize goodsTitle = _goodsTitle;
@synthesize carouselFigure = _carouselFigure;
@synthesize desp = _desp;
@synthesize consignmentPrice = _consignmentPrice;


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
            self.theBuyoutPrice = [[self objectOrNilForKey:kAPDetailCommodityTheBuyoutPrice fromDictionary:dict] doubleValue];
            self.goodsUuid = [self objectOrNilForKey:kAPDetailCommodityGoodsUuid fromDictionary:dict];
            self.originalPrice = [[self objectOrNilForKey:kAPDetailCommodityOriginalPrice fromDictionary:dict] doubleValue];
            self.textForDetails = [self objectOrNilForKey:kAPDetailCommodityTextForDetails fromDictionary:dict];
            self.goodsTitle = [self objectOrNilForKey:kAPDetailCommodityGoodsTitle fromDictionary:dict];
            self.carouselFigure = [self objectOrNilForKey:kAPDetailCommodityCarouselFigure fromDictionary:dict];
            self.desp = [self objectOrNilForKey:kAPDetailCommodityDesp fromDictionary:dict];
            self.consignmentPrice = [[self objectOrNilForKey:kAPDetailCommodityConsignmentPrice fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.theBuyoutPrice] forKey:kAPDetailCommodityTheBuyoutPrice];
    [mutableDict setValue:self.goodsUuid forKey:kAPDetailCommodityGoodsUuid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.originalPrice] forKey:kAPDetailCommodityOriginalPrice];
    [mutableDict setValue:self.textForDetails forKey:kAPDetailCommodityTextForDetails];
    [mutableDict setValue:self.goodsTitle forKey:kAPDetailCommodityGoodsTitle];
    NSMutableArray *tempArrayForCarouselFigure = [NSMutableArray array];
    for (NSObject *subArrayObject in self.carouselFigure) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCarouselFigure addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCarouselFigure addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCarouselFigure] forKey:kAPDetailCommodityCarouselFigure];
    [mutableDict setValue:self.desp forKey:kAPDetailCommodityDesp];
    [mutableDict setValue:[NSNumber numberWithDouble:self.consignmentPrice] forKey:kAPDetailCommodityConsignmentPrice];

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

    self.theBuyoutPrice = [aDecoder decodeDoubleForKey:kAPDetailCommodityTheBuyoutPrice];
    self.goodsUuid = [aDecoder decodeObjectForKey:kAPDetailCommodityGoodsUuid];
    self.originalPrice = [aDecoder decodeDoubleForKey:kAPDetailCommodityOriginalPrice];
    self.textForDetails = [aDecoder decodeObjectForKey:kAPDetailCommodityTextForDetails];
    self.goodsTitle = [aDecoder decodeObjectForKey:kAPDetailCommodityGoodsTitle];
    self.carouselFigure = [aDecoder decodeObjectForKey:kAPDetailCommodityCarouselFigure];
    self.desp = [aDecoder decodeObjectForKey:kAPDetailCommodityDesp];
    self.consignmentPrice = [aDecoder decodeDoubleForKey:kAPDetailCommodityConsignmentPrice];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_theBuyoutPrice forKey:kAPDetailCommodityTheBuyoutPrice];
    [aCoder encodeObject:_goodsUuid forKey:kAPDetailCommodityGoodsUuid];
    [aCoder encodeDouble:_originalPrice forKey:kAPDetailCommodityOriginalPrice];
    [aCoder encodeObject:_textForDetails forKey:kAPDetailCommodityTextForDetails];
    [aCoder encodeObject:_goodsTitle forKey:kAPDetailCommodityGoodsTitle];
    [aCoder encodeObject:_carouselFigure forKey:kAPDetailCommodityCarouselFigure];
    [aCoder encodeObject:_desp forKey:kAPDetailCommodityDesp];
    [aCoder encodeDouble:_consignmentPrice forKey:kAPDetailCommodityConsignmentPrice];
}

- (id)copyWithZone:(NSZone *)zone
{
    APDetailCommodity *copy = [[APDetailCommodity alloc] init];
    
    if (copy) {

        copy.theBuyoutPrice = self.theBuyoutPrice;
        copy.goodsUuid = [self.goodsUuid copyWithZone:zone];
        copy.originalPrice = self.originalPrice;
        copy.textForDetails = [self.textForDetails copyWithZone:zone];
        copy.goodsTitle = [self.goodsTitle copyWithZone:zone];
        copy.carouselFigure = [self.carouselFigure copyWithZone:zone];
        copy.desp = [self.desp copyWithZone:zone];
        copy.consignmentPrice = self.consignmentPrice;
    }
    
    return copy;
}


@end
