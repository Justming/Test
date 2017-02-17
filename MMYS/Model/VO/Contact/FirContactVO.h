//
//  FirContactVO.h
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

@interface FirContactVO : NSObject
@property (nonatomic, retain)NSString *employee_name;
@property (nonatomic, retain)NSString *employee_department_name;
@property (nonatomic, retain)NSString *employee_phone;
@property (nonatomic, retain)NSString *employee_uuid;
@property (nonatomic, retain)NSString *employee_staffID;
@property (nonatomic, retain)NSString *employee_role_name;
@property (nonatomic, retain)NSString *total;
@property (nonatomic, retain)NSString *page;
@property (nonatomic, retain)NSString *employeeHomePhone;
@property (nonatomic, retain)NSString *avatarUrl;


+ (FirContactVO *)FirContactVOWithJSONString:(NSString *)jsonString usingEncoding:(NSStringEncoding)stringEncoding error:(NSError **)error;
+ (FirContactVO *)FirContactVOWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)FirContactVOListWithArray:(NSArray *)array;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
