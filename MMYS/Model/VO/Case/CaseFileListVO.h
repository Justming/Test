//
//  CaseFileListVO.h
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

@interface CaseFileListVO : NSObject

@property (nonatomic, retain) NSString  *fileuuid;
@property (nonatomic, retain) NSString  *fileName;
@property (nonatomic, retain) NSString  *fileUrl;
@property (nonatomic, retain) NSString  *fileExt;
@property (nonatomic, retain) NSString  *createTime;
@property (nonatomic, retain) NSString  *updateTime;

+ (CaseFileListVO *)CaseFileListVOWithJSONString:(NSString *)jsonString usingEncoding:(NSStringEncoding)stringEncoding error:(NSError **)error;
+ (CaseFileListVO *)CaseFileListVOWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)CaseFileListVOListWithArray:(NSArray *)array;

@end
