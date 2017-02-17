//
//  APWaitReceiveSku.m
//
//  Created by   on 16/8/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APWaitReceiveSku.h"


NSString *const kAPWaitReceiveSkuGoodsSize = @"goods_size";
NSString *const kAPWaitReceiveSkuPicture = @"picture";
NSString *const kAPWaitReceiveSkuGoodsColor = @"goods_color";
NSString *const kAPWaitReceiveSkuSkuUuid = @"sku_uuid";


@interface APWaitReceiveSku ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APWaitReceiveSku

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
            self.goodsSize = [self objectOrNilForKey:kAPWaitReceiveSkuGoodsSize fromDictionary:dict];
            self.picture = [self objectOrNilForKey:kAPWaitReceiveSkuPicture fromDictionary:dict];
            self.goodsColor = [self objectOrNilForKey:kAPWaitReceiveSkuGoodsColor fromDictionary:dict];
            self.skuUuid = [self objectOrNilForKey:kAPWaitReceiveSkuSkuUuid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.goodsSize forKey:kAPWaitReceiveSkuGoodsSize];
    [mutableDict setValue:self.picture forKey:kAPWaitReceiveSkuPicture];
    [mutableDict setValue:self.goodsColor forKey:kAPWaitReceiveSkuGoodsColor];
    [mutableDict setValue:self.skuUuid forKey:kAPWaitReceiveSkuSkuUuid];

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

    self.goodsSize = [aDecoder decodeObjectForKey:kAPWaitReceiveSkuGoodsSize];
    self.picture = [aDecoder decodeObjectForKey:kAPWaitReceiveSkuPicture];
    self.goodsColor = [aDecoder decodeObjectForKey:kAPWaitReceiveSkuGoodsColor];
    self.skuUuid = [aDecoder decodeObjectForKey:kAPWaitReceiveSkuSkuUuid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_goodsSize forKey:kAPWaitReceiveSkuGoodsSize];
    [aCoder encodeObject:_picture forKey:kAPWaitReceiveSkuPicture];
    [aCoder encodeObject:_goodsColor forKey:kAPWaitReceiveSkuGoodsColor];
    [aCoder encodeObject:_skuUuid forKey:kAPWaitReceiveSkuSkuUuid];
}

- (id)copyWithZone:(NSZone *)zone
{
    APWaitReceiveSku *copy = [[APWaitReceiveSku alloc] init];
    
    if (copy) {

        copy.goodsSize = [self.goodsSize copyWithZone:zone];
        copy.picture = [self.picture copyWithZone:zone];
        copy.goodsColor = [self.goodsColor copyWithZone:zone];
        copy.skuUuid = [self.skuUuid copyWithZone:zone];
    }
    
    return copy;
}


@end
