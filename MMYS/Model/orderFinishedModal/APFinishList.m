//
//  APFinishList.m
//
//  Created by   on 16/8/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APFinishList.h"
#import "APFinishOrderList.h"


NSString *const kAPFinishListOrderUuid = @"orderUuid";
NSString *const kAPFinishListOrderNumber = @"orderNumber";
NSString *const kAPFinishListOrderList = @"orderList";


@interface APFinishList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APFinishList

@synthesize orderUuid = _orderUuid;
@synthesize orderNumber = _orderNumber;
@synthesize orderList = _orderList;


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
            self.orderUuid = [self objectOrNilForKey:kAPFinishListOrderUuid fromDictionary:dict];
        self.orderNumber= [self objectOrNilForKey:kAPFinishListOrderNumber fromDictionary:dict];
        
    NSObject *receivedAPFinishOrderList = [dict objectForKey:kAPFinishListOrderList];
    NSMutableArray *parsedAPFinishOrderList = [NSMutableArray array];
    if ([receivedAPFinishOrderList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAPFinishOrderList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAPFinishOrderList addObject:[APFinishOrderList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAPFinishOrderList isKindOfClass:[NSDictionary class]]) {
       [parsedAPFinishOrderList addObject:[APFinishOrderList modelObjectWithDictionary:(NSDictionary *)receivedAPFinishOrderList]];
    }

    self.orderList = [NSArray arrayWithArray:parsedAPFinishOrderList];
    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.orderUuid forKey:kAPFinishListOrderUuid];
    
    [mutableDict setValue:self.orderNumber forKey:kAPFinishListOrderNumber];
    
    NSMutableArray *tempArrayForOrderList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.orderList) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForOrderList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForOrderList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOrderList] forKey:kAPFinishListOrderList];

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

    self.orderUuid = [aDecoder decodeObjectForKey:kAPFinishListOrderUuid];
    
    self.orderNumber = [aDecoder decodeObjectForKey:kAPFinishListOrderNumber];
    
    self.orderList = [aDecoder decodeObjectForKey:kAPFinishListOrderList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_orderUuid forKey:kAPFinishListOrderUuid];
     [aCoder encodeObject:_orderNumber forKey:kAPFinishListOrderNumber];
    [aCoder encodeObject:_orderList forKey:kAPFinishListOrderList];
}

- (id)copyWithZone:(NSZone *)zone
{
    APFinishList *copy = [[APFinishList alloc] init];
    
    if (copy) {

        copy.orderUuid = [self.orderUuid copyWithZone:zone];
        copy.orderNumber = [self.orderNumber copyWithZone:zone];
        copy.orderList = [self.orderList copyWithZone:zone];
    }
    return copy;
}


@end
