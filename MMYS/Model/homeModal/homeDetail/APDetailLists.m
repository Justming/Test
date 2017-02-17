//
//  APDetailLists.m
//
//  Created by   on 16/9/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APDetailLists.h"


NSString *const kAPDetailListsGoodsStock = @"goodsStock";
NSString *const kAPDetailListsGoodsSize = @"goodsSize";
NSString *const kAPDetailListsGoodsColor = @"goodsColor";
NSString *const kAPDetailListsPicture = @"picture";
NSString *const kAPDetailListsGoodsId = @"goodsId";
NSString *const kAPDetailListsSkuUuid = @"sku_uuid";


@interface APDetailLists ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APDetailLists

@synthesize goodsStock = _goodsStock;
@synthesize goodsSize = _goodsSize;
@synthesize goodsColor = _goodsColor;
@synthesize picture = _picture;
@synthesize goodsId = _goodsId;
@synthesize skuUuid = _skuUuid;


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
            self.goodsStock = [[self objectOrNilForKey:kAPDetailListsGoodsStock fromDictionary:dict] doubleValue];
            self.goodsSize = [self objectOrNilForKey:kAPDetailListsGoodsSize fromDictionary:dict];
            self.goodsColor = [self objectOrNilForKey:kAPDetailListsGoodsColor fromDictionary:dict];
            self.picture = [self objectOrNilForKey:kAPDetailListsPicture fromDictionary:dict];
            self.goodsId = [[self objectOrNilForKey:kAPDetailListsGoodsId fromDictionary:dict] doubleValue];
            self.skuUuid = [self objectOrNilForKey:kAPDetailListsSkuUuid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsStock] forKey:kAPDetailListsGoodsStock];
    [mutableDict setValue:self.goodsSize forKey:kAPDetailListsGoodsSize];
    [mutableDict setValue:self.goodsColor forKey:kAPDetailListsGoodsColor];
    [mutableDict setValue:self.picture forKey:kAPDetailListsPicture];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kAPDetailListsGoodsId];
    [mutableDict setValue:self.skuUuid forKey:kAPDetailListsSkuUuid];

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

    self.goodsStock = [aDecoder decodeDoubleForKey:kAPDetailListsGoodsStock];
    self.goodsSize = [aDecoder decodeObjectForKey:kAPDetailListsGoodsSize];
    self.goodsColor = [aDecoder decodeObjectForKey:kAPDetailListsGoodsColor];
    self.picture = [aDecoder decodeObjectForKey:kAPDetailListsPicture];
    self.goodsId = [aDecoder decodeDoubleForKey:kAPDetailListsGoodsId];
    self.skuUuid = [aDecoder decodeObjectForKey:kAPDetailListsSkuUuid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_goodsStock forKey:kAPDetailListsGoodsStock];
    [aCoder encodeObject:_goodsSize forKey:kAPDetailListsGoodsSize];
    [aCoder encodeObject:_goodsColor forKey:kAPDetailListsGoodsColor];
    [aCoder encodeObject:_picture forKey:kAPDetailListsPicture];
    [aCoder encodeDouble:_goodsId forKey:kAPDetailListsGoodsId];
    [aCoder encodeObject:_skuUuid forKey:kAPDetailListsSkuUuid];
}

- (id)copyWithZone:(NSZone *)zone
{
    APDetailLists *copy = [[APDetailLists alloc] init];
    
    if (copy) {

        copy.goodsStock = self.goodsStock;
        copy.goodsSize = [self.goodsSize copyWithZone:zone];
        copy.goodsColor = [self.goodsColor copyWithZone:zone];
        copy.picture = [self.picture copyWithZone:zone];
        copy.goodsId = self.goodsId;
        copy.skuUuid = [self.skuUuid copyWithZone:zone];
    }
    
    return copy;
}


@end
