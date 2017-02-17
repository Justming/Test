//
//  HcbTimeHelper.m
//  FitTrainer
//
//  Created by 赵洋 on 15/8/26.
//  Copyright (c) 2015年 Huasheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HcbTimeHelper.h"

#define WEEKS   [NSArray arrayWithObjects:@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六" ,nil]

@implementation HcbTimeHelper

+ (NSString *)weekDayStrOfToday
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit
                                                                   fromDate:[NSDate date]];

    NSInteger   weekday = [components weekday];
    return [WEEKS objectAtIndex:weekday - 1];
}

+ (NSString *)mealForNow
{
    NSDateComponents *components = [[NSCalendar currentCalendar]
                                    components:(NSCalendarUnitHour | NSCalendarUnitMinute)
                                    fromDate:[NSDate date]];
    NSInteger hour   = [components hour];
    NSInteger mimute = [components minute];
    if ((hour==6) || (hour==7) || (hour==8) || (hour==9 && mimute<=30)) {
        return @"早餐";
    }else if((hour==11) || (hour==12) || (hour==13 && mimute<=30)){
        return @"中餐";
    }else if((hour==17) || (hour==18) || (hour==19 && mimute<=30)){
        return @"晚餐";
    }else{
        return @"加餐";
    }
}

+ (NSString *)mealTimeStrForNow
{
    NSDateComponents *components = [[NSCalendar currentCalendar]
                                    components:(NSCalendarUnitHour | NSCalendarUnitMinute)
                                    fromDate:[NSDate date]];
    NSInteger hour   = [components hour];
    NSInteger mimute = [components minute];
    if ((hour==6) || (hour==7) || (hour==8) ||  (hour==9 && mimute<=30)) {
        return @"6:00-9:30";
    }else if((hour==11) || (hour==12) || (hour==13 && mimute<=30)){
        return @"11:00-13:30";
    }else if((hour==17) || (hour==18) || (hour==19 && mimute<=30)){
        return @"17:00-19:30";
    }else{
        
        if (0 <= hour && hour < 6) {
            return @"0:00-6:00";
        }
        if (hour >= 9 && hour < 11) {
            return @"9:30-11:00";
        }
        if (hour >= 13 && hour < 17) {
            return @"13:30-17:00";
        }
        if (hour >= 19 && hour <= 24) {
            return @"19:30-24:00";
        }
        
        return @"加餐";
    }
}

+ (NSString *)currentTimeWithFormat:(NSString*)format
{
    return [self strDate:[NSDate date] WithFormat:format];
}

+ (NSString *)strDate:(NSDate*)date WithFormat:(NSString*)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

+ (NSDate *)dateFrom:(NSString*)str WithFormat:(NSString*)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:format];
}

+ (NSInteger)passedDaysFrom:(NSDate*)date
{
    return ([[NSDate date] timeIntervalSince1970] - [date timeIntervalSince1970])/(24*3600);
}

+ (NSString *)strdate:(NSString*)str WithFormat:(NSString *)format
{
    NSString *time = [NSString stringWithFormat:@"%@",str];
    
    NSInteger num = [time integerValue]/1000;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    NSDate*confromTimesp = [NSDate dateWithTimeIntervalSince1970:num];
    format = [formatter stringFromDate:confromTimesp];
    return format;
}

@end

