//
//  APHomeCellList.m
//
//  Created by   on 16/8/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MMYSHomeCellList.h"


NSString *const kAPHomeCellListEndTime = @"endTime";
NSString *const kAPHomeCellListSpecialName = @"specialName";
NSString *const kAPHomeCellListActivity = @"activity";
NSString *const kAPHomeCellListAddTime = @"addTime";
NSString *const kAPHomeCellListSpecialUuid = @"specialUuid";
NSString *const kAPHomeCellListSpecialDescription = @"specialDescription";
NSString *const kAPHomeCellListSpecialPicture = @"specialPicture";


@interface MMYSHomeCellList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MMYSHomeCellList

@synthesize endTime = _endTime;
@synthesize specialName = _specialName;
@synthesize activity = _activity;
@synthesize addTime = _addTime;
@synthesize specialUuid = _specialUuid;
@synthesize specialDescription = _specialDescription;
@synthesize specialPicture = _specialPicture;


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
            self.endTime = [self objectOrNilForKey:kAPHomeCellListEndTime fromDictionary:dict];
            self.specialName = [self objectOrNilForKey:kAPHomeCellListSpecialName fromDictionary:dict];
            self.activity = [self objectOrNilForKey:kAPHomeCellListActivity fromDictionary:dict];
            self.addTime = [self objectOrNilForKey:kAPHomeCellListAddTime fromDictionary:dict];
            self.specialUuid = [self objectOrNilForKey:kAPHomeCellListSpecialUuid fromDictionary:dict];
            self.specialDescription = [self objectOrNilForKey:kAPHomeCellListSpecialDescription fromDictionary:dict];
            self.specialPicture = [self objectOrNilForKey:kAPHomeCellListSpecialPicture fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.endTime forKey:kAPHomeCellListEndTime];
    [mutableDict setValue:self.specialName forKey:kAPHomeCellListSpecialName];
    [mutableDict setValue:self.activity forKey:kAPHomeCellListActivity];
    [mutableDict setValue:self.addTime forKey:kAPHomeCellListAddTime];
    [mutableDict setValue:self.specialUuid forKey:kAPHomeCellListSpecialUuid];
    [mutableDict setValue:self.specialDescription forKey:kAPHomeCellListSpecialDescription];
    [mutableDict setValue:self.specialPicture forKey:kAPHomeCellListSpecialPicture];

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

    self.endTime = [aDecoder decodeObjectForKey:kAPHomeCellListEndTime];
    self.specialName = [aDecoder decodeObjectForKey:kAPHomeCellListSpecialName];
    self.activity = [aDecoder decodeObjectForKey:kAPHomeCellListActivity];
    self.addTime = [aDecoder decodeObjectForKey:kAPHomeCellListAddTime];
    self.specialUuid = [aDecoder decodeObjectForKey:kAPHomeCellListSpecialUuid];
    self.specialDescription = [aDecoder decodeObjectForKey:kAPHomeCellListSpecialDescription];
    self.specialPicture = [aDecoder decodeObjectForKey:kAPHomeCellListSpecialPicture];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_endTime forKey:kAPHomeCellListEndTime];
    [aCoder encodeObject:_specialName forKey:kAPHomeCellListSpecialName];
    [aCoder encodeObject:_activity forKey:kAPHomeCellListActivity];
    [aCoder encodeObject:_addTime forKey:kAPHomeCellListAddTime];
    [aCoder encodeObject:_specialUuid forKey:kAPHomeCellListSpecialUuid];
    [aCoder encodeObject:_specialDescription forKey:kAPHomeCellListSpecialDescription];
    [aCoder encodeObject:_specialPicture forKey:kAPHomeCellListSpecialPicture];
}

- (id)copyWithZone:(NSZone *)zone
{
    MMYSHomeCellList *copy = [[MMYSHomeCellList alloc] init];
    
    if (copy) {

        copy.endTime = [self.endTime copyWithZone:zone];
        copy.specialName = [self.specialName copyWithZone:zone];
        copy.activity = [self.activity copyWithZone:zone];
        copy.addTime = [self.addTime copyWithZone:zone];
        copy.specialUuid = [self.specialUuid copyWithZone:zone];
        copy.specialDescription = [self.specialDescription copyWithZone:zone];
        copy.specialPicture = [self.specialPicture copyWithZone:zone];
    }
    
    return copy;
}


@end
