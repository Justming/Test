//
//  APIntegList.m
//
//  Created by   on 16/9/13
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APIntegList.h"


NSString *const kAPIntegListAmount = @"amount";
NSString *const kAPIntegListTitle = @"title";
NSString *const kAPIntegListIntegralDetailUuid = @"integral_detail_uuid";
NSString *const kAPIntegListDatetime = @"datetime";


@interface APIntegList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APIntegList

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
            self.amount = [self objectOrNilForKey:kAPIntegListAmount fromDictionary:dict];
            self.title = [self objectOrNilForKey:kAPIntegListTitle fromDictionary:dict];
            self.integralDetailUuid = [self objectOrNilForKey:kAPIntegListIntegralDetailUuid fromDictionary:dict];
            self.datetime = [self objectOrNilForKey:kAPIntegListDatetime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.amount forKey:kAPIntegListAmount];
    [mutableDict setValue:self.title forKey:kAPIntegListTitle];
    [mutableDict setValue:self.integralDetailUuid forKey:kAPIntegListIntegralDetailUuid];
    [mutableDict setValue:self.datetime forKey:kAPIntegListDatetime];

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

    self.amount = [aDecoder decodeObjectForKey:kAPIntegListAmount];
    self.title = [aDecoder decodeObjectForKey:kAPIntegListTitle];
    self.integralDetailUuid = [aDecoder decodeObjectForKey:kAPIntegListIntegralDetailUuid];
    self.datetime = [aDecoder decodeObjectForKey:kAPIntegListDatetime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_amount forKey:kAPIntegListAmount];
    [aCoder encodeObject:_title forKey:kAPIntegListTitle];
    [aCoder encodeObject:_integralDetailUuid forKey:kAPIntegListIntegralDetailUuid];
    [aCoder encodeObject:_datetime forKey:kAPIntegListDatetime];
}

- (id)copyWithZone:(NSZone *)zone
{
    APIntegList *copy = [[APIntegList alloc] init];
    
    if (copy) {

        copy.amount = [self.amount copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.integralDetailUuid = [self.integralDetailUuid copyWithZone:zone];
        copy.datetime = [self.datetime copyWithZone:zone];
    }
    
    return copy;
}


@end
