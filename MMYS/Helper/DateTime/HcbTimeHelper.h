//
//  HcbTimeHelper.h
//  FitTrainer
//
//  Created by 赵洋 on 15/8/26.
//  Copyright (c) 2015年 Huasheng. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface HcbTimeHelper : NSObject

+ (NSString *)weekDayStrOfToday;
+ (NSString *)mealForNow;
+ (NSString *)mealTimeStrForNow;

+ (NSString *)currentTimeWithFormat:(NSString*)format;
+ (NSString *)strDate:(NSDate*)date WithFormat:(NSString*)format;
+ (NSDate *)dateFrom:(NSString*)str WithFormat:(NSString*)format;
+ (NSInteger)passedDaysFrom:(NSDate*)date;
+ (NSString *)strdate:(NSString*)str WithFormat:(NSString *)format;


@end
