//
//  APFinishSku.m
//
//  Created by   on 16/8/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APFinishSku.h"


NSString *const kAPFinishSkuGoodsSize = @"goods_size";
NSString *const kAPFinishSkuPicture = @"picture";
NSString *const kAPFinishSkuGoodsColor = @"goods_color";
NSString *const kAPFinishSkuSkuUuid = @"sku_uuid";


@interface APFinishSku ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APFinishSku

@synthesize goodsSize = _goodsSize;
@synthesize picture = _picture;
@synthesize goodsColor = _goodsColor;
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
            self.goodsSize = [self objectOrNilForKey:kAPFinishSkuGoodsSize fromDictionary:dict];
            self.picture = [self objectOrNilForKey:kAPFinishSkuPicture fromDictionary:dict];
            self.goodsColor = [self objectOrNilForKey:kAPFinishSkuGoodsColor fromDictionary:dict];
            self.skuUuid = [self objectOrNilForKey:kAPFinishSkuSkuUuid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.goodsSize forKey:kAPFinishSkuGoodsSize];
    [mutableDict setValue:self.picture forKey:kAPFinishSkuPicture];
    [mutableDict setValue:self.goodsColor forKey:kAPFinishSkuGoodsColor];
    [mutableDict setValue:self.skuUuid forKey:kAPFinishSkuSkuUuid];

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

    self.goodsSize = [aDecoder decodeObjectForKey:kAPFinishSkuGoodsSize];
    self.picture = [aDecoder decodeObjectForKey:kAPFinishSkuPicture];
    self.goodsColor = [aDecoder decodeObjectForKey:kAPFinishSkuGoodsColor];
    self.skuUuid = [aDecoder decodeObjectForKey:kAPFinishSkuSkuUuid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_goodsSize forKey:kAPFinishSkuGoodsSize];
    [aCoder encodeObject:_picture forKey:kAPFinishSkuPicture];
    [aCoder encodeObject:_goodsColor forKey:kAPFinishSkuGoodsColor];
    [aCoder encodeObject:_skuUuid forKey:kAPFinishSkuSkuUuid];
}

- (id)copyWithZone:(NSZone *)zone
{
    APFinishSku *copy = [[APFinishSku alloc] init];
    
    if (copy) {

        copy.goodsSize = [self.goodsSize copyWithZone:zone];
        copy.picture = [self.picture copyWithZone:zone];
        copy.goodsColor = [self.goodsColor copyWithZone:zone];
        copy.skuUuid = [self.skuUuid copyWithZone:zone];
    }
    
    return copy;
}


@end
