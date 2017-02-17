//
//  APSysMessageList.m
//
//  Created by   on 16/9/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APSysMessageList.h"


NSString *const kAPSysMessageListTitle = @"title";
NSString *const kAPSysMessageListDatetime = @"datetime";


@interface APSysMessageList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APSysMessageList

@synthesize title = _title;
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
            self.title = [self objectOrNilForKey:kAPSysMessageListTitle fromDictionary:dict];
            self.datetime = [self objectOrNilForKey:kAPSysMessageListDatetime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kAPSysMessageListTitle];
    [mutableDict setValue:self.datetime forKey:kAPSysMessageListDatetime];

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

    self.title = [aDecoder decodeObjectForKey:kAPSysMessageListTitle];
    self.datetime = [aDecoder decodeObjectForKey:kAPSysMessageListDatetime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kAPSysMessageListTitle];
    [aCoder encodeObject:_datetime forKey:kAPSysMessageListDatetime];
}

- (id)copyWithZone:(NSZone *)zone
{
    APSysMessageList *copy = [[APSysMessageList alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.datetime = [self.datetime copyWithZone:zone];
    }
    
    return copy;
}


@end
