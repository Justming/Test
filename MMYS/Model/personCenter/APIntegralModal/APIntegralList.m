//
//  APIntegralList.m
//
//  Created by   on 16/9/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APIntegralList.h"


NSString *const kAPIntegralListAmount = @"amount";
NSString *const kAPIntegralListTitle = @"title";
NSString *const kAPIntegralListIntegralDetailUuid = @"integral_detail_uuid";
NSString *const kAPIntegralListDatetime = @"datetime";


@interface APIntegralList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APIntegralList

@synthesize amount = _amount;
@synthesize title = _title;
@synthesize integralDetailUuid = _integralDetailUuid;
@synthesize datetime = _datetime;


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
            self.amount = [[self objectOrNilForKey:kAPIntegralListAmount fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kAPIntegralListTitle fromDictionary:dict];
            self.integralDetailUuid = [self objectOrNilForKey:kAPIntegralListIntegralDetailUuid fromDictionary:dict];
            self.datetime = [self objectOrNilForKey:kAPIntegralListDatetime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.amount] forKey:kAPIntegralListAmount];
    [mutableDict setValue:self.title forKey:kAPIntegralListTitle];
    [mutableDict setValue:self.integralDetailUuid forKey:kAPIntegralListIntegralDetailUuid];
    [mutableDict setValue:self.datetime forKey:kAPIntegralListDatetime];

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

    self.amount = [aDecoder decodeDoubleForKey:kAPIntegralListAmount];
    self.title = [aDecoder decodeObjectForKey:kAPIntegralListTitle];
    self.integralDetailUuid = [aDecoder decodeObjectForKey:kAPIntegralListIntegralDetailUuid];
    self.datetime = [aDecoder decodeObjectForKey:kAPIntegralListDatetime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_amount forKey:kAPIntegralListAmount];
    [aCoder encodeObject:_title forKey:kAPIntegralListTitle];
    [aCoder encodeObject:_integralDetailUuid forKey:kAPIntegralListIntegralDetailUuid];
    [aCoder encodeObject:_datetime forKey:kAPIntegralListDatetime];
}

- (id)copyWithZone:(NSZone *)zone
{
    APIntegralList *copy = [[APIntegralList alloc] init];
    
    if (copy) {

        copy.amount = self.amount;
        copy.title = [self.title copyWithZone:zone];
        copy.integralDetailUuid = [self.integralDetailUuid copyWithZone:zone];
        copy.datetime = [self.datetime copyWithZone:zone];
    }
    
    return copy;
}


@end
