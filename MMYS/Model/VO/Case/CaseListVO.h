//
//  CaseListVO.h
//  firefly
//
//  Created by JamHonyZ on 16/1/20.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#if ! __has_feature(objc_arc)
#define JSONAutoRelease(param) ([param autorelease]);
#else
#define JSONAutoRelease(param) (param)
#endif

@interface CaseListVO : NSObject

@property (nonatomic, retain) NSString  *caseuuid;
@property (nonatomic, retain) NSString  *clientName;
@property (nonatomic, retain) NSString  *judgePhone;
@property (nonatomic, retain) NSString  *caseName;
@property (nonatomic, retain) NSString  *caseType;
@property (nonatomic, retain) NSString  *secondType;
@property (nonatomic, retain) NSArray   *processList;
@property (nonatomic, retain) NSArray   *eventList;
@property (nonatomic, retain) NSString  *isComplete;
@property (nonatomic, assign) NSInteger  lastEventInfo;

+ (CaseListVO *)CaseListVOWithJSONString:(NSString *)jsonString usingEncoding:(NSStringEncoding)stringEncoding error:(NSError **)error;
+ (CaseListVO *)CaseListVOWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)CaseListVOListWithArray:(NSArray *)array;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
