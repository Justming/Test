//
//  APHomeCellBody.m
//
//  Created by   on 16/8/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APHomeCellBody.h"
#import "MMYSHomeCellList.h"


NSString *const kAPHomeCellBodyResult = @"result";
NSString *const kAPHomeCellBodyList = @"list";
NSString *const kAPHomeCellBodyDescription = @"description";
NSString *const kAPHomeCellBodyTotal = @"total";
NSString *const kAPHomeCellBodyPage = @"page";


@interface APHomeCellBody ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APHomeCellBody

@synthesize result = _result;
@synthesize list = _list;
@synthesize bodyDescription = _bodyDescription;
@synthesize total = _total;
@synthesize page = _page;


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
            self.result = [self objectOrNilForKey:kAPHomeCellBodyResult fromDictionary:dict];
    NSObject *receivedAPHomeCellList = [dict objectForKey:kAPHomeCellBodyList];
    NSMutableArray *parsedAPHomeCellList = [NSMutableArray array];
    if ([receivedAPHomeCellList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAPHomeCellList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAPHomeCellList addObject:[MMYSHomeCellList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAPHomeCellList isKindOfClass:[NSDictionary class]]) {
       [parsedAPHomeCellList addObject:[MMYSHomeCellList modelObjectWithDictionary:(NSDictionary *)receivedAPHomeCellList]];
    }

    self.list = [NSArray arrayWithArray:parsedAPHomeCellList];
            self.bodyDescription = [self objectOrNilForKey:kAPHomeCellBodyDescription fromDictionary:dict];
            self.total = [[self objectOrNilForKey:kAPHomeCellBodyTotal fromDictionary:dict] doubleValue];
            self.page = [[self objectOrNilForKey:kAPHomeCellBodyPage fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kAPHomeCellBodyResult];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.list) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kAPHomeCellBodyList];
    [mutableDict setValue:self.bodyDescription forKey:kAPHomeCellBodyDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kAPHomeCellBodyTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kAPHomeCellBodyPage];

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

    self.result = [aDecoder decodeObjectForKey:kAPHomeCellBodyResult];
    self.list = [aDecoder decodeObjectForKey:kAPHomeCellBodyList];
    self.bodyDescription = [aDecoder decodeObjectForKey:kAPHomeCellBodyDescription];
    self.total = [aDecoder decodeDoubleForKey:kAPHomeCellBodyTotal];
    self.page = [aDecoder decodeDoubleForKey:kAPHomeCellBodyPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kAPHomeCellBodyResult];
    [aCoder encodeObject:_list forKey:kAPHomeCellBodyList];
    [aCoder encodeObject:_bodyDescription forKey:kAPHomeCellBodyDescription];
    [aCoder encodeDouble:_total forKey:kAPHomeCellBodyTotal];
    [aCoder encodeDouble:_page forKey:kAPHomeCellBodyPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    APHomeCellBody *copy = [[APHomeCellBody alloc] init];
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.bodyDescription = [self.bodyDescription copyWithZone:zone];
        copy.total = self.total;
        copy.page = self.page;
    }
    
    return copy;
}


@end
