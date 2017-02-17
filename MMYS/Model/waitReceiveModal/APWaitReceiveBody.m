//
//  APWaitReceiveBody.m
//
//  Created by   on 16/8/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APWaitReceiveBody.h"
#import "APWaitReceiveList.h"


NSString *const kAPWaitReceiveBodyList = @"list";


@interface APWaitReceiveBody ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APWaitReceiveBody

@synthesize list = _list;


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
    NSObject *receivedAPWaitReceiveList = [dict objectForKey:kAPWaitReceiveBodyList];
    NSMutableArray *parsedAPWaitReceiveList = [NSMutableArray array];
    if ([receivedAPWaitReceiveList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAPWaitReceiveList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAPWaitReceiveList addObject:[APWaitReceiveList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAPWaitReceiveList isKindOfClass:[NSDictionary class]]) {
       [parsedAPWaitReceiveList addObject:[APWaitReceiveList modelObjectWithDictionary:(NSDictionary *)receivedAPWaitReceiveList]];
    }

    self.list = [NSArray arrayWithArray:parsedAPWaitReceiveList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kAPWaitReceiveBodyList];

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

    self.list = [aDecoder decodeObjectForKey:kAPWaitReceiveBodyList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_list forKey:kAPWaitReceiveBodyList];
}

- (id)copyWithZone:(NSZone *)zone
{
    APWaitReceiveBody *copy = [[APWaitReceiveBody alloc] init];
    
    if (copy) {

        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
