//
//  FirAnnouncementVO.m
//  firefly
//
//  Created by Ding on 16/6/27.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FirCaseVO.h"

@implementation FirCaseVO
+ (FirCaseVO *)FirCaseVOWithJSONString:(NSString *)jsonString usingEncoding:(NSStringEncoding)stringEncoding error:(NSError **)error
{
    NSData *jsonData = [jsonString dataUsingEncoding:stringEncoding];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:0
                                                                     error:error];
    
    if (nil != error && nil != jsonDictionary) {
        return [FirCaseVO FirCaseVOWithDictionary:jsonDictionary];
    }
    
    return nil;
}

+ (FirCaseVO *)FirCaseVOWithDictionary:(NSDictionary *)dictionary
{
    FirCaseVO *instance = [[FirCaseVO alloc] initWithDictionary:dictionary];
    return JSONAutoRelease(instance);
}

+ (NSArray *)FirCaseVOListWithArray:(NSArray *)array
{
    if (!array || ![array isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSMutableArray *resultsArray = [[NSMutableArray alloc] init];
    
    for (id entry in array) {
        if (![entry isKindOfClass:[NSDictionary class]]) {
            continue;
        }
        
        [resultsArray addObject:[FirCaseVO FirCaseVOWithDictionary:entry]];
    }
    
    return JSONAutoRelease(resultsArray);
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        if ([dictionary objectForKey:@"approvalOrAssignment"] && ![[dictionary objectForKey:@"approvalOrAssignment"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"approvalOrAssignment"] isKindOfClass:[NSString class]]) {
            self.approvalOrAssignment = [dictionary objectForKey:@"approvalOrAssignment"];
        }
        
        if ([dictionary objectForKey:@"approvalStatus"] && ![[dictionary objectForKey:@"approvalStatus"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"approvalStatus"] isKindOfClass:[NSString class]]) {
            self.approvalStatus = [dictionary objectForKey:@"approvalStatus"];
        }
        
        if ([dictionary objectForKey:@"approvalTitle"] && ![[dictionary objectForKey:@"approvalTitle"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"approvalTitle"] isKindOfClass:[NSString class]]) {
            self.approvalTitle = [dictionary objectForKey:@"approvalTitle"];
        }
        
        if ([dictionary objectForKey:@"sapprovalType"] && ![[dictionary objectForKey:@"sapprovalType"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"sapprovalType"] isKindOfClass:[NSString class]]) {
            self.sapprovalType = [dictionary objectForKey:@"sapprovalType"];
        }
        
        if ([dictionary objectForKey:@"createDatetime"] && ![[dictionary objectForKey:@"createDatetime"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"createDatetime"] isKindOfClass:[NSString class]]) {
            self.createDatetime = [dictionary objectForKey:@"createDatetime"];
        }
        if ([dictionary objectForKey:@"approvalUuid"] && ![[dictionary objectForKey:@"approvalUuid"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"approvalUuid"] isKindOfClass:[NSString class]]) {
            self.approvalUuid = [dictionary objectForKey:@"approvalUuid"];
        }
        
        if ([dictionary objectForKey:@"eventTodoUuid"] && ![[dictionary objectForKey:@"eventTodoUuid"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"eventTodoUuid"] isKindOfClass:[NSString class]]) {
            self.eventTodoUuid = [dictionary objectForKey:@"eventTodoUuid"];
        }
        
        if ([dictionary objectForKey:@"missionsUuid"] && ![[dictionary objectForKey:@"missionsUuid"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"missionsUuid"] isKindOfClass:[NSString class]]) {
            self.missionsUuid = [dictionary objectForKey:@"missionsUuid"];
        }
        
        if ([dictionary objectForKey:@"missionsTitle"] && ![[dictionary objectForKey:@"missionsTitle"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"missionsTitle"] isKindOfClass:[NSString class]]) {
            self.missionsTitle = [dictionary objectForKey:@"missionsTitle"];
        }
        
        if ([dictionary objectForKey:@"missionsStatus"] && ![[dictionary objectForKey:@"missionsStatus"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"missionsStatus"] isKindOfClass:[NSString class]]) {
            self.missionsStatus = [dictionary objectForKey:@"missionsStatus"];
        }
        
    }
    return self;
}

@end
