//
//  APDetailBody.m
//
//  Created by   on 16/9/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APDetailBody.h"
#import "APDetailCommodity.h"
#import "APDetailSkus.h"


NSString *const kAPDetailBodyResult = @"result";
NSString *const kAPDetailBodyCommodity = @"commodity";
NSString *const kAPDetailBodyDescription = @"description";
NSString *const kAPDetailBodySkus = @"skus";


@interface APDetailBody ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APDetailBody

@synthesize result = _result;
@synthesize commodity = _commodity;
@synthesize bodyDescription = _bodyDescription;
@synthesize skus = _skus;


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
            self.result = [self objectOrNilForKey:kAPDetailBodyResult fromDictionary:dict];
            self.commodity = [APDetailCommodity modelObjectWithDictionary:[dict objectForKey:kAPDetailBodyCommodity]];
            self.bodyDescription = [self objectOrNilForKey:kAPDetailBodyDescription fromDictionary:dict];
    NSObject *receivedAPDetailSkus = [dict objectForKey:kAPDetailBodySkus];
    NSMutableArray *parsedAPDetailSkus = [NSMutableArray array];
    if ([receivedAPDetailSkus isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAPDetailSkus) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAPDetailSkus addObject:[APDetailSkus modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAPDetailSkus isKindOfClass:[NSDictionary class]]) {
       [parsedAPDetailSkus addObject:[APDetailSkus modelObjectWithDictionary:(NSDictionary *)receivedAPDetailSkus]];
    }

    self.skus = [NSArray arrayWithArray:parsedAPDetailSkus];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kAPDetailBodyResult];
    [mutableDict setValue:[self.commodity dictionaryRepresentation] forKey:kAPDetailBodyCommodity];
    [mutableDict setValue:self.bodyDescription forKey:kAPDetailBodyDescription];
    NSMutableArray *tempArrayForSkus = [NSMutableArray array];
    for (NSObject *subArrayObject in self.skus) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSkus addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSkus addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSkus] forKey:kAPDetailBodySkus];

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

    self.result = [aDecoder decodeObjectForKey:kAPDetailBodyResult];
    self.commodity = [aDecoder decodeObjectForKey:kAPDetailBodyCommodity];
    self.bodyDescription = [aDecoder decodeObjectForKey:kAPDetailBodyDescription];
    self.skus = [aDecoder decodeObjectForKey:kAPDetailBodySkus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kAPDetailBodyResult];
    [aCoder encodeObject:_commodity forKey:kAPDetailBodyCommodity];
    [aCoder encodeObject:_bodyDescription forKey:kAPDetailBodyDescription];
    [aCoder encodeObject:_skus forKey:kAPDetailBodySkus];
}

- (id)copyWithZone:(NSZone *)zone
{
    APDetailBody *copy = [[APDetailBody alloc] init];
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.commodity = [self.commodity copyWithZone:zone];
        copy.bodyDescription = [self.bodyDescription copyWithZone:zone];
        copy.skus = [self.skus copyWithZone:zone];
    }
    
    return copy;
}


@end
