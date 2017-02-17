//
//  CaseListVO.m
//  firefly
//
//  Created by JamHonyZ on 16/1/20.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "CaseListVO.h"

@implementation CaseListVO

+ (CaseListVO *)CaseListVOWithJSONString:(NSString *)jsonString usingEncoding:(NSStringEncoding)stringEncoding error:(NSError **)error
{
    NSData *jsonData = [jsonString dataUsingEncoding:stringEncoding];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:0
                                                                     error:error];
    
    if (nil != error && nil != jsonDictionary) {
        return [CaseListVO CaseListVOWithDictionary:jsonDictionary];
    }
    
    return nil;
}

+ (CaseListVO *)CaseListVOWithDictionary:(NSDictionary *)dictionary
{
    CaseListVO *instance = [[CaseListVO alloc] initWithDictionary:dictionary];
    return JSONAutoRelease(instance);
}

+ (NSArray *)CaseListVOListWithArray:(NSArray *)array
{
    if (!array || ![array isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSMutableArray *resultsArray = [[NSMutableArray alloc] init];
    
    for (id entry in array) {
        if (![entry isKindOfClass:[NSDictionary class]]) {
            continue;
        }
        
        [resultsArray addObject:[CaseListVO CaseListVOWithDictionary:entry]];
    }
    
    return JSONAutoRelease(resultsArray);
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        
        if (nil != [dictionary objectForKey:@"case_uuid"] && ![[dictionary objectForKey:@"case_uuid"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"case_uuid"] isKindOfClass:[NSString class]]) {
            self.caseuuid = [dictionary objectForKey:@"case_uuid"];
        }
        
        if (nil != [dictionary objectForKey:@"client_name"] && ![[dictionary objectForKey:@"client_name"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"client_name"] isKindOfClass:[NSString class]]) {
            self.clientName = [dictionary objectForKey:@"client_name"];
        }
        
        if (nil != [dictionary objectForKey:@"judge_phone"] && ![[dictionary objectForKey:@"judge_phone"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"judge_phone"] isKindOfClass:[NSString class]]) {
            self.judgePhone = [dictionary objectForKey:@"judge_phone"];
        }
        
        if (nil != [dictionary objectForKey:@"case_name"] && ![[dictionary objectForKey:@"case_name"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"case_name"] isKindOfClass:[NSString class]]) {
            self.caseName = [dictionary objectForKey:@"case_name"];
        }
        
        if (nil != [dictionary objectForKey:@"case_type"] && ![[dictionary objectForKey:@"case_type"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"case_type"] isKindOfClass:[NSString class]]) {
            self.caseType = [dictionary objectForKey:@"case_type"];
        }
        
        if (nil != [dictionary objectForKey:@"second_type"] && ![[dictionary objectForKey:@"second_type"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"second_type"] isKindOfClass:[NSString class]]) {
            self.secondType = [dictionary objectForKey:@"second_type"];
        }
        
        if (nil != [dictionary objectForKey:@"process_list"] && ![[dictionary objectForKey:@"process_list"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"process_list"] isKindOfClass:[NSArray class]]) {
            self.processList = [dictionary objectForKey:@"process_list"];
        }
        
        if (nil != [dictionary objectForKey:@"event_list"] && ![[dictionary objectForKey:@"event_list"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"event_list"] isKindOfClass:[NSArray class]]) {
            self.eventList = [dictionary objectForKey:@"event_list"];
        }
        
        if (nil != [dictionary objectForKey:@"is_complete"] && ![[dictionary objectForKey:@"is_complete"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"is_complete"] isKindOfClass:[NSString class]]) {
            self.isComplete = [dictionary objectForKey:@"is_complete"];
        }
        
    }
    return self;
}


@end
