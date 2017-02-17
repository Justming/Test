//
//  FirAnnouncementVO.h
//  firefly
//
//  Created by Ding on 16/6/27.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#if ! __has_feature(objc_arc)
#define JSONAutoRelease(param) ([param autorelease]);
#else
#define JSONAutoRelease(param) (param)
#endif


@interface FirCaseVO : NSObject

@property (nonatomic, retain) NSString  *approvalOrAssignment;
@property (nonatomic, retain) NSString  *approvalStatus;
@property (nonatomic, retain) NSString  *approvalTitle;
@property (nonatomic, retain) NSString  *sapprovalType;
@property (nonatomic, retain) NSString  *createDatetime;
@property (nonatomic, retain) NSString  *approvalUuid;
@property (nonatomic, retain) NSString  *eventTodoUuid;
@property (nonatomic, retain) NSString  *missionsUuid;
@property (nonatomic, retain) NSString  *missionsTitle;
@property (nonatomic, retain) NSString  *missionsStatus;

+ (FirCaseVO *)FirCaseVOWithJSONString:(NSString *)jsonString usingEncoding:(NSStringEncoding)stringEncoding error:(NSError **)error;
+ (FirCaseVO *)FirCaseVOWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)FirCaseVOListWithArray:(NSArray *)array;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
