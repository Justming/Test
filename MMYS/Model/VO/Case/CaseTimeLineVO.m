//
//  CaseTimeLineVO.m
//  firefly
//
//  Created by JamHonyZ on 16/1/21.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "CaseTimeLineVO.h"
#import "CaseFileListVO.h"

@implementation CaseTimeLineVO

+ (CaseTimeLineVO *)CaseTimeLineVOWithJSONString:(NSString *)jsonString usingEncoding:(NSStringEncoding)stringEncoding error:(NSError **)error
{
    NSData *jsonData = [jsonString dataUsingEncoding:stringEncoding];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:0
                                                                     error:error];
    
    if (nil != error && nil != jsonDictionary) {
        return [CaseTimeLineVO CaseTimeLineVOWithDictionary:jsonDictionary];
    }
    
    return nil;
}

+ (CaseTimeLineVO *)CaseTimeLineVOWithDictionary:(NSDictionary *)dictionary
{
    CaseTimeLineVO *instance = [[CaseTimeLineVO alloc] initWithDictionary:dictionary];
    return JSONAutoRelease(instance);
}

+ (NSArray *)CaseTimeLineVOListWithArray:(NSArray *)array
{
    if (!array || ![array isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSMutableArray *resultsArray = [[NSMutableArray alloc] init];
    
    for (id entry in array) {
        if (![entry isKindOfClass:[NSDictionary class]]) {
            continue;
        }
        
        [resultsArray addObject:[CaseTimeLineVO CaseTimeLineVOWithDictionary:entry]];
    }
    
    return JSONAutoRelease(resultsArray);
}


- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        
        if (nil != [dictionary objectForKey:@"type"] && ![[dictionary objectForKey:@"type"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"type"] isKindOfClass:[NSString class]]) {
            self.type = [dictionary objectForKey:@"type"];
        }
        
        if (nil != [dictionary objectForKey:@"update_datetime"] && ![[dictionary objectForKey:@"update_datetime"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"update_datetime"] isKindOfClass:[NSString class]]) {
            self.updateTime = [dictionary objectForKey:@"update_datetime"];
        }
        
        if (nil != [dictionary objectForKey:@"process_uuid"] && ![[dictionary objectForKey:@"process_uuid"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"process_uuid"] isKindOfClass:[NSString class]]) {
            self.processuuid = [dictionary objectForKey:@"process_uuid"];
        }
        
        if (nil != [dictionary objectForKey:@"stage"] && ![[dictionary objectForKey:@"stage"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"stage"] isKindOfClass:[NSString class]]) {
            self.stage = [dictionary objectForKey:@"stage"];
        }
        
        if (nil != [dictionary objectForKey:@"event_uuid"] && ![[dictionary objectForKey:@"event_uuid"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"event_uuid"] isKindOfClass:[NSString class]]) {
            self.eventuuid = [dictionary objectForKey:@"event_uuid"];
        }
        
        if (nil != [dictionary objectForKey:@"time"] && ![[dictionary objectForKey:@"time"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"time"] isKindOfClass:[NSString class]]) {
            self.time = [dictionary objectForKey:@"time"];
        }
        
        if (nil != [dictionary objectForKey:@"content"] && ![[dictionary objectForKey:@"content"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"content"] isKindOfClass:[NSString class]]) {
            self.content = [dictionary objectForKey:@"content"];
        }
        
        if (nil != [dictionary objectForKey:@"file_list"] && ![[dictionary objectForKey:@"file_list"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"file_list"] isKindOfClass:[NSArray class]]) {
            self.fileList = [CaseFileListVO CaseFileListVOListWithArray:[dictionary objectForKey:@"file_list"]];
        }
        
        if (nil != [dictionary objectForKey:@"image_url_list"] && ![[dictionary objectForKey:@"image_url_list"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"image_url_list"] isKindOfClass:[NSArray class]]) {
            self.imgurlList = [dictionary objectForKey:@"image_url_list"];
        }
        self.ifFirst = NO;
        self.ifLast  = NO;
    }
    return self;
}


@end
