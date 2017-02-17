//
//  Sku.m
//
//  Created by   on 16/8/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "SkuModal.h"


NSString *const kSkuGoodsSize = @"goods_size";
NSString *const kSkuPicture = @"picture";
NSString *const kSkuGoodsColor = @"goods_color";
NSString *const kSkuSkuUuid = @"sku_uuid";


@interface SkuModal ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SkuModal

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
            self.goodsSize = [self objectOrNilForKey:kSkuGoodsSize fromDictionary:dict];
            self.picture = [self objectOrNilForKey:kSkuPicture fromDictionary:dict];
            self.goodsColor = [self objectOrNilForKey:kSkuGoodsColor fromDictionary:dict];
            self.skuUuid = [self objectOrNilForKey:kSkuSkuUuid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.goodsSize forKey:kSkuGoodsSize];
    [mutableDict setValue:self.picture forKey:kSkuPicture];
    [mutableDict setValue:self.goodsColor forKey:kSkuGoodsColor];
    [mutableDict setValue:self.skuUuid forKey:kSkuSkuUuid];

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

    self.goodsSize = [aDecoder decodeObjectForKey:kSkuGoodsSize];
    self.picture = [aDecoder decodeObjectForKey:kSkuPicture];
    self.goodsColor = [aDecoder decodeObjectForKey:kSkuGoodsColor];
    self.skuUuid = [aDecoder decodeObjectForKey:kSkuSkuUuid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_goodsSize forKey:kSkuGoodsSize];
    [aCoder encodeObject:_picture forKey:kSkuPicture];
    [aCoder encodeObject:_goodsColor forKey:kSkuGoodsColor];
    [aCoder encodeObject:_skuUuid forKey:kSkuSkuUuid];
}

- (id)copyWithZone:(NSZone *)zone
{
    SkuModal *copy = [[SkuModal alloc] init];
    
    if (copy) {
        copy.goodsSize = [self.goodsSize copyWithZone:zone];
        copy.picture = [self.picture copyWithZone:zone];
        copy.goodsColor = [self.goodsColor copyWithZone:zone];
        copy.skuUuid = [self.skuUuid copyWithZone:zone];
    }
    return copy;
}


@end
