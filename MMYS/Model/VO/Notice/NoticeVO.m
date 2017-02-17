//
//  NoticeVO.m
//  firefly
//
//  Created by Huasheng on 16/7/6.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "NoticeVO.h"
#import "CaseFileListVO.h"

@implementation NoticeVO

+ (NoticeVO *)NoticeVOWithDictionary:(NSDictionary *)dictionary
{
    NoticeVO *instance = [[NoticeVO alloc] initWithDictionary:dictionary];
    return JSONAutoRelease(instance);
}

+ (NSArray *)NoticeVOListWithArray:(NSArray *)array
{
    if (!array || ![array isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSMutableArray *resultsArray = [[NSMutableArray alloc] init];
    
    for (id entry in array) {
        if (![entry isKindOfClass:[NSDictionary class]]) {
            continue;
        }
        
        [resultsArray addObject:[NoticeVO NoticeVOWithDictionary:entry]];
    }
    
    return JSONAutoRelease(resultsArray);
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        
        if ([dictionary objectForKey:@"announcementCreatorUuid"] && ![[dictionary objectForKey:@"announcementCreatorUuid"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"announcementCreatorUuid"] isKindOfClass:[NSString class]]) {
            
            self.creator_uuid = [dictionary objectForKey:@"announcementCreatorUuid"];
        }
        
        if ([dictionary objectForKey:@"announcementCreateName"] && ![[dictionary objectForKey:@"announcementCreateName"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"announcementCreateName"] isKindOfClass:[NSString class]]) {
            
            self.creatorName = [dictionary objectForKey:@"announcementCreateName"];
        }
        
        if ([dictionary objectForKey:@"announcementTitle"] && ![[dictionary objectForKey:@"announcementTitle"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"announcementTitle"] isKindOfClass:[NSString class]]) {
            
            self.Title = [dictionary objectForKey:@"announcementTitle"];
        }
        
        if ([dictionary objectForKey:@"announcementDsp"] && ![[dictionary objectForKey:@"announcementDsp"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"announcementDsp"] isKindOfClass:[NSString class]]) {
            
            self.Description = [dictionary objectForKey:@"announcementDsp"];
        }
        
        if ([dictionary objectForKey:@"announcementUuid"] && ![[dictionary objectForKey:@"announcementUuid"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"announcementUuid"] isKindOfClass:[NSString class]]) {
            
            self.NoticeUUID = [dictionary objectForKey:@"announcementUuid"];
        }
        
        if ([dictionary objectForKey:@"createDatetime"] && ![[dictionary objectForKey:@"createDatetime"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"createDatetime"] isKindOfClass:[NSNumber class]]) {
            
            self.Time = [NSDate dateWithTimeIntervalSince1970:[(NSNumber *)[dictionary objectForKey:@"createDatetime"] floatValue] / 1000];
        }
        
        if ([dictionary objectForKey:@"urlAndName"] && ![[dictionary objectForKey:@"urlAndName"] isEqual:[NSNull null]]
            && [[dictionary objectForKey:@"urlAndName"] isKindOfClass:[NSArray class]]) {
            
            self.attatchment = [CaseFileListVO CaseFileListVOListWithArray:[dictionary objectForKey:@"urlAndName"]];
        }
    }
    return self;
}

@end
