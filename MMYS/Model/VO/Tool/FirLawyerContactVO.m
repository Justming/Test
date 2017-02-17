//
//  FirLawyerContactVO.m
//  firefly
//
//  Created by JamHonyZ on 16/1/26.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FirLawyerContactVO.h"

@implementation FirLawyerContactVO

+ (FirLawyerContactVO *)FirLawyerContactVOWithJSONString:(NSString *)jsonString usingEncoding:(NSStringEncoding)stringEncoding error:(NSError **)error
{
    NSData *jsonData = [jsonString dataUsingEncoding:stringEncoding];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:0
                                                                     error:error];
    
    if (nil != error && nil != jsonDictionary) {
        return [FirLawyerContactVO FirLawyerContactVOWithDictionary:jsonDictionary];
    }
    
    return nil;
}

+ (FirLawyerContactVO *)FirLawyerContactVOWithDictionary:(NSDictionary *)dictionary
{
    FirLawyerContactVO *instance = [[FirLawyerContactVO alloc] initWithDictionary:dictionary];
    return JSONAutoRelease(instance);
}

+ (NSArray *)FirLawyerContactVOListWithArray:(NSArray *)array
{
    if (!array || ![array isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSMutableArray *resultsArray = [[NSMutableArray alloc] init];
    
    for (id entry in array) {
        if (![entry isKindOfClass:[NSDictionary class]]) {
            continue;
        }
        
        [resultsArray addObject:[FirLawyerContactVO FirLawyerContactVOWithDictionary:entry]];
    }
    
    return JSONAutoRelease(resultsArray);
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        if ([dictionary objectForKey:@"firm"] && ![[dictionary objectForKey:@"firm"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"firm"] isKindOfClass:[NSString class]]) {
            self.firm = [dictionary objectForKey:@"firm"];
        }
        
        if ([dictionary objectForKey:@"part"] && ![[dictionary objectForKey:@"part"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"part"] isKindOfClass:[NSString class]]) {
            self.part = [dictionary objectForKey:@"part"];
        }
        
        if ([dictionary objectForKey:@"shortNum"] && ![[dictionary objectForKey:@"shortNum"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"shortNum"] isKindOfClass:[NSString class]]) {
            self.shortNum = [dictionary objectForKey:@"shortNum"];
        }
        
        
        if ([dictionary objectForKey:@"name"] && ![[dictionary objectForKey:@"name"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"name"] isKindOfClass:[NSString class]]) {
            self.name = [dictionary objectForKey:@"name"];
        }
        
        if ([dictionary objectForKey:@"phone"] && ![[dictionary objectForKey:@"phone"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"phone"] isKindOfClass:[NSString class]]) {
            self.phone = [dictionary objectForKey:@"phone"];
        }
        
        if ([dictionary objectForKey:@"courtRoom"] && ![[dictionary objectForKey:@"courtRoom"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"courtRoom"] isKindOfClass:[NSString class]]) {
            self.courtRoom = [dictionary objectForKey:@"courtRoom"];
        }
    }
    return self;
}

@end
