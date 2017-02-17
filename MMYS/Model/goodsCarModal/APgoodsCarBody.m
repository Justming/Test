//
//  APgoodsCarBody.m
//
//  Created by   on 16/8/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APgoodsCarBody.h"
#import "APgoodsCarList.h"


NSString *const kAPgoodsCarBodyResult = @"result";
NSString *const kAPgoodsCarBodyList = @"list";
NSString *const kAPgoodsCarBodyDescription = @"description";


@interface APgoodsCarBody ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APgoodsCarBody

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
            self.result = [self objectOrNilForKey:kAPgoodsCarBodyResult fromDictionary:dict];
    NSObject *receivedAPgoodsCarList = [dict objectForKey:kAPgoodsCarBodyList];
    NSMutableArray *parsedAPgoodsCarList = [NSMutableArray array];
    if ([receivedAPgoodsCarList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAPgoodsCarList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAPgoodsCarList addObject:[APgoodsCarList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAPgoodsCarList isKindOfClass:[NSDictionary class]]) {
       [parsedAPgoodsCarList addObject:[APgoodsCarList modelObjectWithDictionary:(NSDictionary *)receivedAPgoodsCarList]];
    }

    self.list = [NSArray arrayWithArray:parsedAPgoodsCarList];
            self.bodyDescription = [self objectOrNilForKey:kAPgoodsCarBodyDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.result forKey:kAPgoodsCarBodyResult];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kAPgoodsCarBodyList];
    [mutableDict setValue:self.bodyDescription forKey:kAPgoodsCarBodyDescription];

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

    self.result = [aDecoder decodeObjectForKey:kAPgoodsCarBodyResult];
    self.list = [aDecoder decodeObjectForKey:kAPgoodsCarBodyList];
    self.bodyDescription = [aDecoder decodeObjectForKey:kAPgoodsCarBodyDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kAPgoodsCarBodyResult];
    [aCoder encodeObject:_list forKey:kAPgoodsCarBodyList];
    [aCoder encodeObject:_bodyDescription forKey:kAPgoodsCarBodyDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    APgoodsCarBody *copy = [[APgoodsCarBody alloc] init];
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.list = [self.list copyWithZone:zone];
        copy.bodyDescription = [self.bodyDescription copyWithZone:zone];
    }
    
    return copy;
}


@end
