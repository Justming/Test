//
//  APCashList.m
//
//  Created by   on 16/9/13
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "APCashList.h"


NSString *const kAPCashListAmount = @"amount";
NSString *const kAPCashListWithdrawalsUuid = @"withdrawals_uuid";
NSString *const kAPCashListTitle = @"title";
NSString *const kAPCashListDatetime = @"datetime";
NSString *const kAPCashListMerchantsPayTreasure = @"merchants_pay_treasure";


@interface APCashList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation APCashList

@synthesize amount = _amount;
@synthesize withdrawalsUuid = _withdrawalsUuid;
@synthesize title = _title;
@synthesize datetime = _datetime;
@synthesize merchantsPayTreasure = _merchantsPayTreasure;


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
            self.amount = [self objectOrNilForKey:kAPCashListAmount fromDictionary:dict];
            self.withdrawalsUuid = [self objectOrNilForKey:kAPCashListWithdrawalsUuid fromDictionary:dict];
            self.title = [self objectOrNilForKey:kAPCashListTitle fromDictionary:dict];
            self.datetime = [self objectOrNilForKey:kAPCashListDatetime fromDictionary:dict];
            self.merchantsPayTreasure = [self objectOrNilForKey:kAPCashListMerchantsPayTreasure fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.amount forKey:kAPCashListAmount];
    [mutableDict setValue:self.withdrawalsUuid forKey:kAPCashListWithdrawalsUuid];
    [mutableDict setValue:self.title forKey:kAPCashListTitle];
    [mutableDict setValue:self.datetime forKey:kAPCashListDatetime];
    [mutableDict setValue:self.merchantsPayTreasure forKey:kAPCashListMerchantsPayTreasure];

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

    self.amount = [aDecoder decodeObjectForKey:kAPCashListAmount];
    self.withdrawalsUuid = [aDecoder decodeObjectForKey:kAPCashListWithdrawalsUuid];
    self.title = [aDecoder decodeObjectForKey:kAPCashListTitle];
    self.datetime = [aDecoder decodeObjectForKey:kAPCashListDatetime];
    self.merchantsPayTreasure = [aDecoder decodeObjectForKey:kAPCashListMerchantsPayTreasure];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_amount forKey:kAPCashListAmount];
    [aCoder encodeObject:_withdrawalsUuid forKey:kAPCashListWithdrawalsUuid];
    [aCoder encodeObject:_title forKey:kAPCashListTitle];
    [aCoder encodeObject:_datetime forKey:kAPCashListDatetime];
    [aCoder encodeObject:_merchantsPayTreasure forKey:kAPCashListMerchantsPayTreasure];
}

- (id)copyWithZone:(NSZone *)zone
{
    APCashList *copy = [[APCashList alloc] init];
    
    if (copy) {

        copy.amount = [self.amount copyWithZone:zone];
        copy.withdrawalsUuid = [self.withdrawalsUuid copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.datetime = [self.datetime copyWithZone:zone];
        copy.merchantsPayTreasure = [self.merchantsPayTreasure copyWithZone:zone];
    }
    
    return copy;
}


@end
