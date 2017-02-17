//
//  FitDateTimeStringFactory.m
//  FitTrainer
//
//  Created by Huasheng on 15/8/27.
//  Copyright (c) 2015年 Huasheng. All rights reserved.
//

#import "FitDateTimeStringFactory.h"

@implementation FitDateTimeStringFactory

+ (NSString *)convertFromDate:(NSDate *)date
{
//    if ([[self datePrefix:date isShort:NO] isEqualToString:@""]) {
//        return [self formatTime:date];
//    } else {
//        NSCalendar *cal = [NSCalendar currentCalendar];
//        NSDateComponents *components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit) fromDate:[NSDate date]];
//        NSDate *thisWeek = [cal dateFromComponents:components];
//        components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit) fromDate:date];
//        NSDate *refWeek = [cal dateFromComponents:components];
//        
//        NSUInteger weekCntNow = [[NSCalendar currentCalendar] ordinalityOfUnit:NSWeekCalendarUnit inUnit:NSMonthCalendarUnit forDate:[NSDate date]];
//        NSUInteger weekCntRef = [[NSCalendar currentCalendar] ordinalityOfUnit:NSWeekCalendarUnit inUnit:NSMonthCalendarUnit forDate:date];
//        
//        if([thisWeek isEqualToDate:refWeek] && weekCntNow == weekCntRef) {
//            return [NSString stringWithFormat:@"%@ %@", [self datePrefix:date isShort:YES], [self formatTime:date]];
//        } else {
//            return [self datePrefix:date isShort:YES];
//        }
//    }
    
    return nil;
}

+ (NSString *)goodDate:(NSDate *)date
{
    if ([[self datePrefix:date isShort:NO] isEqualToString:@""]) {
        return [self formatTime:date];
    } else {
        return [self datePrefix:date isShort:YES];
    }
    
    return nil;
}

+ (NSString *)datePrefix:(NSDate *)date
                 isShort:(BOOL)isshort
{
//    NSDate *today = [NSDate date];
//    NSDate *yesterday = [NSDate dateWithTimeIntervalSinceNow:-86400];
//    NSDate *refDate = date;
//    
//    // 10 first characters of description is the calendar date:
//    NSString * todayString = [[today description] substringToIndex:10];
//    NSString * yesterdayString = [[yesterday description] substringToIndex:10];
//    NSString * refDateString = [[refDate description] substringToIndex:10];
//    
//    if ([refDateString isEqualToString:todayString])
//    {
//        return @"";
//    } else if ([refDateString isEqualToString:yesterdayString]) {
//        return @"昨天";
//    } else {
//        NSCalendar *cal = [NSCalendar currentCalendar];
//        NSDateComponents *components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit) fromDate:[NSDate date]];
//        NSDate *thisWeek = [cal dateFromComponents:components];
//        components = [cal components:(NSEraCalendarUnit|NSYearCalendarUnit|NSMonthCalendarUnit) fromDate:date];
//        NSDate *refWeek = [cal dateFromComponents:components];
//        
//        NSUInteger weekCntNow = [[NSCalendar currentCalendar] ordinalityOfUnit:NSWeekCalendarUnit inUnit:NSMonthCalendarUnit forDate:[NSDate date]];
//        NSUInteger weekCntRef = [[NSCalendar currentCalendar] ordinalityOfUnit:NSWeekCalendarUnit inUnit:NSMonthCalendarUnit forDate:date];
//        
//        NSDateComponents *nowCmps = [cal components:NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear fromDate:[NSDate date]];
//        NSDateComponents *refCmps = [cal components:NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear fromDate:date];
//        
//        if([thisWeek isEqualToDate:refWeek] && weekCntNow == weekCntRef) {
//            return [self weekDayStr:date];
//        } else {
//            if (isshort) {
//                if (nowCmps.year == refCmps.year) {
//                    return [self formatDateThisYear:date];
//                }
//                return [self formatDate:date];
//            } else {
//                return [NSDateFormatter localizedStringFromDate:date
//                                                      dateStyle:NSDateFormatterMediumStyle
//                                                      timeStyle:NSDateFormatterNoStyle];
//            }
//        }
//    }
    return nil;
}

+ (NSString *)weekDayStr:(NSDate *)date
{
//    NSCalendar *cal = [NSCalendar currentCalendar];
//    NSDateComponents *components = [cal components:(NSWeekdayCalendarUnit) fromDate:date];
//    
//    switch ([components weekday]) {
//        case 1:
////            return NSLocalizedStringFromTable(@"Sun", @"HuanCheBaAppString", @"星期日");
//            return @"星期日";
//            break;
//            
//        case 2:
////            return NSLocalizedStringFromTable(@"Mon", @"HuanCheBaAppString", @"星期一");
//            return @"星期一";
//            break;
//            
//        case 3:
////            return NSLocalizedStringFromTable(@"Tue", @"HuanCheBaAppString", @"星期二");
//            return @"星期二";
//            break;
//            
//        case 4:
////            return NSLocalizedStringFromTable(@"Wed", @"HuanCheBaAppString", @"星期三");
//            return @"星期三";
//            break;
//            
//        case 5:
////            return NSLocalizedStringFromTable(@"Thu", @"HuanCheBaAppString", @"星期四");
//            return @"星期四";
//            break;
//            
//        case 6:
////            return NSLocalizedStringFromTable(@"Fri", @"HuanCheBaAppString", @"星期五");
//            return @"星期五";
//            break;
//            
//        case 7:
////            return NSLocalizedStringFromTable(@"Sat", @"HuanCheBaAppString", @"星期六");
//            return @"星期六";
//            break;
//            
//        default:
//            break;
//    }
    return nil;
}

+ (NSString *)formatTime:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"H:mm"];
    NSString *str = [formatter stringFromDate:date];
    return str;
}

+ (NSString *)formatDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *str = [formatter stringFromDate:date];
    return str;
}

+ (NSString *)formatDateThisYear:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MM月"];
    NSString *str = [formatter stringFromDate:date];
    return str;
}

+ (NSString *)getTimeStr:(NSDate *)date
{
    int         counter;
    NSString    *unit;
    
    double timeDiff = [date timeIntervalSince1970] - [[NSDate date] timeIntervalSince1970];
    
    if (timeDiff < 300) {
        
        return @"刚刚";
    }
    
    if (timeDiff < 3600) {
        
        counter = floor(timeDiff / 60.);
        unit    = @"分钟hou";
        
    } else if (timeDiff < 3600 * 24) {
        
        counter = floor(timeDiff / 3600.);
        unit    = @"小时后";
        
    } else if (timeDiff < 3600 * 24 * 7) {
        
        counter = floor(timeDiff / (3600 * 24.));
        unit    = @"天后";
        
    } else if (timeDiff < 3600 * 24 * 30) {
        
        counter = floor(timeDiff / (3600 * 24 * 7.));
        unit    = @"周后";
        
    } else {
        
        counter = floor(timeDiff / (3600 * 24 * 30));
        unit    = @"月后";
        
    }
    
    return [NSString stringWithFormat:@"%d%@", counter, unit];
}

@end
