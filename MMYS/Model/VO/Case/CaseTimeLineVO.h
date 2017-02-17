//
//  CaseTimeLineVO.h
//  firefly
//
//  Created by JamHonyZ on 16/1/21.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#if ! __has_feature(objc_arc)
#define JSONAutoRelease(param) ([param autorelease]);
#else
#define JSONAutoRelease(param) (param)
#endif

@interface CaseTimeLineVO : NSObject

@property (nonatomic, retain) NSString  *type;
@property (nonatomic, retain) NSString  *updateTime;
@property (nonatomic, retain) NSString  *processuuid;
@property (nonatomic, retain) NSString  *stage;
@property (nonatomic, retain) NSString  *eventuuid;
@property (nonatomic, retain) NSString  *time;
@property (nonatomic, retain) NSString  *content;
@property (nonatomic, retain) NSArray   *fileList;
@property (nonatomic, retain) NSArray   *imgurlList;
@property (nonatomic, assign) BOOL      ifFirst;
@property (nonatomic, assign) BOOL      ifLast;

+ (CaseTimeLineVO *)CaseTimeLineVOWithJSONString:(NSString *)jsonString usingEncoding:(NSStringEncoding)stringEncoding error:(NSError **)error;
+ (CaseTimeLineVO *)CaseTimeLineVOWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)CaseTimeLineVOListWithArray:(NSArray *)array;

@end
