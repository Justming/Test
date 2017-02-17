//
//  APgoodsCarSku.m
//
//  Created by   on 16/8/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APgoodsCarSku.h"


NSString *const kAPgoodsCarSkuGoodsSize = @"goods_size";
NSString *const kAPgoodsCarSkuPicture = @"picture";
NSString *const kAPgoodsCarSkuGoodsColor = @"goods_color";
NSString *const kAPgoodsCarSkuSkuUuid = @"sku_uuid";


@interface APgoodsCarSku ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APgoodsCarSku

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
            self.goodsSize = [self objectOrNilForKey:kAPgoodsCarSkuGoodsSize fromDictionary:dict];
            self.picture = [self objectOrNilForKey:kAPgoodsCarSkuPicture fromDictionary:dict];
            self.goodsColor = [self objectOrNilForKey:kAPgoodsCarSkuGoodsColor fromDictionary:dict];
            self.skuUuid = [self objectOrNilForKey:kAPgoodsCarSkuSkuUuid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.goodsSize forKey:kAPgoodsCarSkuGoodsSize];
    [mutableDict setValue:self.picture forKey:kAPgoodsCarSkuPicture];
    [mutableDict setValue:self.goodsColor forKey:kAPgoodsCarSkuGoodsColor];
    [mutableDict setValue:self.skuUuid forKey:kAPgoodsCarSkuSkuUuid];

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

    self.goodsSize = [aDecoder decodeObjectForKey:kAPgoodsCarSkuGoodsSize];
    self.picture = [aDecoder decodeObjectForKey:kAPgoodsCarSkuPicture];
    self.goodsColor = [aDecoder decodeObjectForKey:kAPgoodsCarSkuGoodsColor];
    self.skuUuid = [aDecoder decodeObjectForKey:kAPgoodsCarSkuSkuUuid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_goodsSize forKey:kAPgoodsCarSkuGoodsSize];
    [aCoder encodeObject:_picture forKey:kAPgoodsCarSkuPicture];
    [aCoder encodeObject:_goodsColor forKey:kAPgoodsCarSkuGoodsColor];
    [aCoder encodeObject:_skuUuid forKey:kAPgoodsCarSkuSkuUuid];
}

- (id)copyWithZone:(NSZone *)zone
{
    APgoodsCarSku *copy = [[APgoodsCarSku alloc] init];
    
    if (copy) {

        copy.goodsSize = [self.goodsSize copyWithZone:zone];
        copy.picture = [self.picture copyWithZone:zone];
        copy.goodsColor = [self.goodsColor copyWithZone:zone];
        copy.skuUuid = [self.skuUuid copyWithZone:zone];
    }
    
    return copy;
}


@end
