//
//  CaseFileListVO.m
//  firefly
//
//  Created by JamHonyZ on 16/1/21.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "CaseFileListVO.h"

@implementation CaseFileListVO

+ (CaseFileListVO *)CaseFileListVOWithJSONString:(NSString *)jsonString usingEncoding:(NSStringEncoding)stringEncoding error:(NSError **)error
{
    NSData *jsonData = [jsonString dataUsingEncoding:stringEncoding];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:0
                                                                     error:error];
    
    if (nil != error && nil != jsonDictionary) {
        return [CaseFileListVO CaseFileListVOWithDictionary:jsonDictionary];
    }
    
    return nil;
}

+ (CaseFileListVO *)CaseFileListVOWithDictionary:(NSDictionary *)dictionary
{
    CaseFileListVO *instance = [[CaseFileListVO alloc] initWithDictionary:dictionary];
    return JSONAutoRelease(instance);
}

+ (NSArray *)CaseFileListVOListWithArray:(NSArray *)array
{
    if (!array || ![array isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSMutableArray *resultsArray = [[NSMutableArray alloc] init];
    
    for (id entry in array) {
        if (![entry isKindOfClass:[NSDictionary class]]) {
            continue;
        }
        
        [resultsArray addObject:[CaseFileListVO CaseFileListVOWithDictionary:entry]];
    }
    
    return JSONAutoRelease(resultsArray);
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        
        if (nil != [dictionary objectForKey:@"uuid"] && ![[dictionary objectForKey:@"uuid"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"uuid"] isKindOfClass:[NSString class]]) {
            self.fileuuid = [dictionary objectForKey:@"uuid"];
        }
        
        if (nil != [dictionary objectForKey:@"name"] && ![[dictionary objectForKey:@"name"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"name"] isKindOfClass:[NSString class]]) {
            self.fileName = [dictionary objectForKey:@"name"];
        }
        
        if (nil != [dictionary objectForKey:@"url"] && ![[dictionary objectForKey:@"url"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"url"] isKindOfClass:[NSString class]]) {
            self.fileUrl = [dictionary objectForKey:@"url"];
        }
        
        if (nil != [dictionary objectForKey:@"file_ext"] && ![[dictionary objectForKey:@"file_ext"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"file_ext"] isKindOfClass:[NSString class]]) {
            self.fileExt = [dictionary objectForKey:@"file_ext"];
        }
        
        if (nil != [dictionary objectForKey:@"create_datetime"] && ![[dictionary objectForKey:@"create_datetime"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"create_datetime"] isKindOfClass:[NSString class]]) {
            self.createTime = [dictionary objectForKey:@"create_datetime"];
        }
        
        if (nil != [dictionary objectForKey:@"update_datetime"] && ![[dictionary objectForKey:@"update_datetime"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"update_datetime"] isKindOfClass:[NSString class]]) {
            self.updateTime = [dictionary objectForKey:@"update_datetime"];
        }
        
    }
    return self;
}

@end
