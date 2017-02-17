//
//  APWaitReceiveList.m
//
//  Created by   on 16/8/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APWaitReceiveList.h"
#import "APWaitReceiveOrderList.h"


NSString *const kAPWaitReceiveListOrderUuid = @"orderUuid";
NSString *const kAPWaitReceiveListOrderNumber = @"orderNumber";
NSString *const kAPWaitReceiveListOrderList = @"orderList";


@interface APWaitReceiveList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APWaitReceiveList

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
        self.orderUuid = [self objectOrNilForKey:kAPWaitReceiveListOrderUuid fromDictionary:dict];
        self.orderNumber=[self objectOrNilForKey:kAPWaitReceiveListOrderNumber fromDictionary:dict];
        
    NSObject *receivedAPWaitReceiveOrderList = [dict objectForKey:kAPWaitReceiveListOrderList];
    NSMutableArray *parsedAPWaitReceiveOrderList = [NSMutableArray array];
    if ([receivedAPWaitReceiveOrderList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAPWaitReceiveOrderList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAPWaitReceiveOrderList addObject:[APWaitReceiveOrderList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAPWaitReceiveOrderList isKindOfClass:[NSDictionary class]]) {
       [parsedAPWaitReceiveOrderList addObject:[APWaitReceiveOrderList modelObjectWithDictionary:(NSDictionary *)receivedAPWaitReceiveOrderList]];
    }

    self.orderList = [NSArray arrayWithArray:parsedAPWaitReceiveOrderList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.orderUuid forKey:kAPWaitReceiveListOrderUuid];
     [mutableDict setValue:self.orderNumber forKey:kAPWaitReceiveListOrderNumber];
    
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOrderList] forKey:kAPWaitReceiveListOrderList];

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

    self.orderUuid = [aDecoder decodeObjectForKey:kAPWaitReceiveListOrderUuid];
    self.orderList = [aDecoder decodeObjectForKey:kAPWaitReceiveListOrderList];
    self.orderNumber = [aDecoder decodeObjectForKey:kAPWaitReceiveListOrderNumber];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_orderUuid forKey:kAPWaitReceiveListOrderUuid];
    [aCoder encodeObject:_orderList forKey:kAPWaitReceiveListOrderList];
    [aCoder encodeObject:_orderNumber forKey:kAPWaitReceiveListOrderNumber];
}

- (id)copyWithZone:(NSZone *)zone
{
    APWaitReceiveList *copy = [[APWaitReceiveList alloc] init];
    
    if (copy) {

        copy.orderUuid = [self.orderUuid copyWithZone:zone];
        copy.orderList = [self.orderList copyWithZone:zone];
        copy.orderNumber = [self.orderNumber copyWithZone:zone];
    }
    
    return copy;
}


@end
