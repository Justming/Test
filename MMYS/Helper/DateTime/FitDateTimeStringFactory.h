
//
//  FitDateTimeStringFactory.h
//  FitTrainer
//
//  Created by Huasheng on 15/8/27.
//  Copyright (c) 2015年 Huasheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FitDateTimeStringFactory : NSObject

+ (NSString *)convertFromDate:(NSDate *)date;
+ (NSString *)goodDate:(NSDate *)date;
+ (NSString *)getTimeStr:(NSDate *)date;
+ (NSString *)formatDateThisYear:(NSDate *)date;
+ (NSString *)weekDayStr:(NSDate *)date;
@end
