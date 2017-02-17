//
//  APgoodsCarList.m
//
//  Created by   on 16/8/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APgoodsCarList.h"
#import "APgoodsCarBuyItems.h"


NSString *const kAPgoodsCarListGoodsUuid = @"goodsUuid";
NSString *const kAPgoodsCarListBuyItems = @"buyItems";
NSString *const kAPgoodsCarListGoodsName = @"goodsName";


@interface APgoodsCarList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APgoodsCarList

@synthesize goodsUuid = _goodsUuid;
@synthesize buyItems = _buyItems;
@synthesize goodsName = _goodsName;

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
            self.goodsUuid = [self objectOrNilForKey:kAPgoodsCarListGoodsUuid fromDictionary:dict];
    NSObject *receivedAPgoodsCarBuyItems = [dict objectForKey:kAPgoodsCarListBuyItems];
    NSMutableArray *parsedAPgoodsCarBuyItems = [NSMutableArray array];
    if ([receivedAPgoodsCarBuyItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAPgoodsCarBuyItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAPgoodsCarBuyItems addObject:[APgoodsCarBuyItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAPgoodsCarBuyItems isKindOfClass:[NSDictionary class]]) {
       [parsedAPgoodsCarBuyItems addObject:[APgoodsCarBuyItems modelObjectWithDictionary:(NSDictionary *)receivedAPgoodsCarBuyItems]];
    }

    self.buyItems = [NSArray arrayWithArray:parsedAPgoodsCarBuyItems];
            self.goodsName = [self objectOrNilForKey:kAPgoodsCarListGoodsName fromDictionary:dict];
        
    self.selected=YES;

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.goodsUuid forKey:kAPgoodsCarListGoodsUuid];
    NSMutableArray *tempArrayForBuyItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.buyItems) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBuyItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBuyItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBuyItems] forKey:kAPgoodsCarListBuyItems];
    [mutableDict setValue:self.goodsName forKey:kAPgoodsCarListGoodsName];

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

    self.goodsUuid = [aDecoder decodeObjectForKey:kAPgoodsCarListGoodsUuid];
    self.buyItems = [aDecoder decodeObjectForKey:kAPgoodsCarListBuyItems];
    self.goodsName = [aDecoder decodeObjectForKey:kAPgoodsCarListGoodsName];
    
    self.selected=YES;
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_goodsUuid forKey:kAPgoodsCarListGoodsUuid];
    [aCoder encodeObject:_buyItems forKey:kAPgoodsCarListBuyItems];
    [aCoder encodeObject:_goodsName forKey:kAPgoodsCarListGoodsName];
    
    self.selected=YES;
}

- (id)copyWithZone:(NSZone *)zone
{
    APgoodsCarList *copy = [[APgoodsCarList alloc] init];
    
    if (copy) {

        copy.goodsUuid = [self.goodsUuid copyWithZone:zone];
        copy.buyItems = [self.buyItems copyWithZone:zone];
        copy.goodsName = [self.goodsName copyWithZone:zone];
        
        self.selected=YES;
    }
    
    return copy;
}


@end
