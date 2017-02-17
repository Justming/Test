//
//  APDetailSkus.m
//
//  Created by   on 16/9/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APDetailSkus.h"
#import "APDetailLists.h"


NSString *const kAPDetailSkusLists = @"lists";
NSString *const kAPDetailSkusSize = @"size";


@interface APDetailSkus ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APDetailSkus

@synthesize lists = _lists;
@synthesize size = _size;


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
    NSObject *receivedAPDetailLists = [dict objectForKey:kAPDetailSkusLists];
    NSMutableArray *parsedAPDetailLists = [NSMutableArray array];
    if ([receivedAPDetailLists isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAPDetailLists) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAPDetailLists addObject:[APDetailLists modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAPDetailLists isKindOfClass:[NSDictionary class]]) {
       [parsedAPDetailLists addObject:[APDetailLists modelObjectWithDictionary:(NSDictionary *)receivedAPDetailLists]];
    }

    self.lists = [NSArray arrayWithArray:parsedAPDetailLists];
            self.size = [self objectOrNilForKey:kAPDetailSkusSize fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForLists = [NSMutableArray array];
    for (NSObject *subArrayObject in self.lists) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForLists addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForLists addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForLists] forKey:kAPDetailSkusLists];
    [mutableDict setValue:self.size forKey:kAPDetailSkusSize];

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

    self.lists = [aDecoder decodeObjectForKey:kAPDetailSkusLists];
    self.size = [aDecoder decodeObjectForKey:kAPDetailSkusSize];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_lists forKey:kAPDetailSkusLists];
    [aCoder encodeObject:_size forKey:kAPDetailSkusSize];
}

- (id)copyWithZone:(NSZone *)zone
{
    APDetailSkus *copy = [[APDetailSkus alloc] init];
    
    if (copy) {

        copy.lists = [self.lists copyWithZone:zone];
        copy.size = [self.size copyWithZone:zone];
    }
    
    return copy;
}


@end
