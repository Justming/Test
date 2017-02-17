//
//  FirContactVO.m
//  firefly
//
//  Created by Ding on 16/6/27.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FirContactVO.h"

@implementation FirContactVO


+ (FirContactVO *)FirContactVOWithJSONString:(NSString *)jsonString usingEncoding:(NSStringEncoding)stringEncoding error:(NSError **)error
{
    NSData *jsonData = [jsonString dataUsingEncoding:stringEncoding];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:0
                                                                     error:error];
    
    if (nil != error && nil != jsonDictionary) {
        return [FirContactVO FirContactVOWithDictionary:jsonDictionary];
    }
    
    return nil;
}

+ (FirContactVO *)FirContactVOWithDictionary:(NSDictionary *)dictionary
{
    FirContactVO *instance = [[FirContactVO alloc] initWithDictionary:dictionary];
    return JSONAutoRelease(instance);
}

+ (NSArray *)FirContactVOListWithArray:(NSArray *)array
{
    if (!array || ![array isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSMutableArray *resultsArray = [[NSMutableArray alloc] init];
    
    for (id entry in array) {
        if (![entry isKindOfClass:[NSDictionary class]]) {
            continue;
        }
        
        [resultsArray addObject:[FirContactVO FirContactVOWithDictionary:entry]];
    }
    
    return JSONAutoRelease(resultsArray);
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        if ([dictionary objectForKey:@"employee_name"] && ![[dictionary objectForKey:@"employee_name"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"employee_name"] isKindOfClass:[NSString class]]) {
            self.employee_name = [dictionary objectForKey:@"employee_name"];
        }
        
        if ([dictionary objectForKey:@"employee_department_name"] && ![[dictionary objectForKey:@"employee_department_name"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"employee_department_name"] isKindOfClass:[NSString class]]) {
            self.employee_department_name = [dictionary objectForKey:@"employee_department_name"];
        }
        
        if ([dictionary objectForKey:@"employee_phone"] && ![[dictionary objectForKey:@"employee_phone"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"employee_phone"] isKindOfClass:[NSString class]]) {
            self.employee_phone = [dictionary objectForKey:@"employee_phone"];
        }
        
        if ([dictionary objectForKey:@"employee_uuid"] && ![[dictionary objectForKey:@"employee_uuid"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"employee_uuid"] isKindOfClass:[NSString class]]) {
            self.employee_uuid = [dictionary objectForKey:@"employee_uuid"];
        }
        
        if ([dictionary objectForKey:@"employee_staffID"] && ![[dictionary objectForKey:@"employee_staffID"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"employee_staffID"] isKindOfClass:[NSString class]]) {
            self.employee_staffID = [dictionary objectForKey:@"employee_staffID"];
        }
        if ([dictionary objectForKey:@"employee_role_name"] && ![[dictionary objectForKey:@"employee_role_name"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"employee_role_name"] isKindOfClass:[NSString class]]) {
            self.employee_role_name = [dictionary objectForKey:@"employee_role_name"];
        }
        if ([dictionary objectForKey:@"total"] && ![[dictionary objectForKey:@"total"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"total"] isKindOfClass:[NSString class]]) {
            self.total = [dictionary objectForKey:@"total"];
        }
        if ([dictionary objectForKey:@"page"] && ![[dictionary objectForKey:@"page"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"page"] isKindOfClass:[NSString class]]) {
            self.page = [dictionary objectForKey:@"page"];
        }
        if ([dictionary objectForKey:@"employeeHomePhone"] && ![[dictionary objectForKey:@"employeeHomePhone"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"employeeHomePhone"] isKindOfClass:[NSString class]]) {
            self.employeeHomePhone = [dictionary objectForKey:@"employeeHomePhone"];
        }
        if ([dictionary objectForKey:@"avatarUrl"] && ![[dictionary objectForKey:@"avatarUrl"] isEqual:[NSNull null]] && [[dictionary objectForKey:@"avatarUrl"] isKindOfClass:[NSString class]]) {
            self.avatarUrl = [dictionary objectForKey:@"avatarUrl"];
        }
        
    }
    return self;
}


@end
