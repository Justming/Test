
//
//  NoticeVO.h
//  firefly
//
//  Created by Huasheng on 16/7/6.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#if ! __has_feature(objc_arc)
#define JSONAutoRelease(param) ([param autorelease]);
#else
#define JSONAutoRelease(param) (param)
#endif

@interface NoticeVO : NSObject

@property (nonatomic, retain) NSString *creator_uuid;
@property (nonatomic, retain) NSString *creatorName;
@property (nonatomic, retain) NSString *Title;
@property (nonatomic, retain) NSString *Description;
@property (nonatomic, retain) NSString *NoticeUUID;
@property (nonatomic, retain) NSDate    *Time;
@property (nonatomic, retain) NSArray   *attatchment;

+ (NoticeVO *)NoticeVOWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)NoticeVOListWithArray:(NSArray *)array;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
