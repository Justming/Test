//
//  FirLawyerContactVO.h
//  firefly
//
//  Created by JamHonyZ on 16/1/26.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#if ! __has_feature(objc_arc)
#define JSONAutoRelease(param) ([param autorelease]);
#else
#define JSONAutoRelease(param) (param)
#endif

@interface FirLawyerContactVO : NSObject

@property (nonatomic, retain) NSString  *firm;
@property (nonatomic, retain) NSString  *part;
@property (nonatomic, retain) NSString  *name;
@property (nonatomic, retain) NSString  *shortNum;
@property (nonatomic, retain) NSString  *phone;

@property (nonatomic, retain) NSString  *courtRoom;

+ (FirLawyerContactVO *)FirLawyerContactVOWithJSONString:(NSString *)jsonString usingEncoding:(NSStringEncoding)stringEncoding error:(NSError **)error;
+ (FirLawyerContactVO *)FirLawyerContactVOWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)FirLawyerContactVOListWithArray:(NSArray *)array;

@end
