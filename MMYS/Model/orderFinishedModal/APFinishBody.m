//
//  APFinishBody.m
//
//  Created by   on 16/8/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APFinishBody.h"
#import "APFinishList.h"


NSString *const kAPFinishBodyResult = @"result";
NSString *const kAPFinishBodyList = @"list";
NSString *const kAPFinishBodyDescription = @"description";


@interface APFinishBody ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APFinishBody

@synthesize result = _result;
@synthesize list = _list;
@synthesize bodyDescription = _bodyDescription;


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
            self.result = [self objectOrNilForKey:kAPFinishBodyResult fromDictionary:dict];
    NSObject *receivedAPFinishList = [dict objectForKey:kAPFinishBodyList];
    NSMutableArray *parsedAPFinishList = [NSMutableArray array];
    if ([receivedAPFinishList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAPFinishList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAPFinishList addObject:[APFinishList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAPFinishList isKindOfClass:[NSDictionary class]]) {
       [parsedAPFinishList addObject:[APFinishList modelObjectWithDictionary:(NSDictionary *)receivedAPFinishList]];
    }

    self.list = [NSArray arrayWithArray:parsedAPFinishList];
            self.bodyDescription = [self objectOrNilForKey:kAPFinishBodyDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kAPFinishBodyResult];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kAPFinishBodyList];
    [mutableDict setValue:self.bodyDescription forKey:kAPFinishBodyDescription];

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

    self.result = [aDecoder decodeObjectForKey:kAPFinishBodyResult];
    self.list = [aDecoder decodeObjectForKey:kAPFinishBodyList];
    self.bodyDescription = [aDecoder decodeObjectForKey:kAPFinishBodyDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kAPFinishBodyResult];
    [aCoder encodeObject:_list forKey:kAPFinishBodyList];
    [aCoder encodeObject:_bodyDescription forKey:kAPFinishBodyDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    APFinishBody *copy = [[APFinishBody alloc] init];
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.bodyDescription = [self.bodyDescription copyWithZone:zone];
    }
    
    return copy;
}


@end
