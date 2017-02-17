//
//  FitMessageTimeHelper.m
//  FitTrainer
//
//  Created by Huasheng on 15/10/7.
//  Copyright © 2015年 Huasheng. All rights reserved.
//

#import "FitMessageTimeHelper.h"

#define DAY         3600*24

@implementation FitMessageTimeHelper

+ (NSString *)getDateStr:(NSDate *)date
{
    if (!date || ![date isKindOfClass:[NSDate class]]) {
        return nil;
    }
    
    NSDateComponents        *components     = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                                                              fromDate:date];
    
    NSInteger               year            = [components year];
    NSInteger               month           = [components month];
    NSInteger               day             = [components day];
    
    components                              = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                                                                        | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond)
                                                                              fromDate:[NSDate date]];
    
    NSInteger               yearNow         = [components year];
    NSInteger               monthNow        = [components month];
    NSInteger               dayNow          = [components day];
    NSInteger               hourNow         = [components hour];
    NSInteger               minuteNow       = [components minute];
    NSInteger               secondNow       = [components second];
    
    if (year == yearNow && month == monthNow && day == dayNow) {
        
        NSDateFormatter     *formatter      = [[NSDateFormatter alloc] init];
        
        [formatter setDateFormat:@"H:mm"];
        return [formatter stringFromDate:date];
    }
    
    NSTimeInterval          now             = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval          timestamp       = [date timeIntervalSince1970];
    double                  offSet          = hourNow * 3600 + minuteNow * 60 + secondNow;
    
    if (now - timestamp > offSet && now - timestamp < offSet + DAY) {
        
        NSDateFormatter     *formatter      = [[NSDateFormatter alloc] init];
        
        [formatter setDateFormat:@"H:mm"];
        return [NSString stringWithFormat:@"昨天 %@", [formatter stringFromDate:date]];
    }
    
    if (now - timestamp > offSet + DAY && now - timestamp < offSet + 2 * DAY) {
        
        NSDateFormatter     *formatter      = [[NSDateFormatter alloc] init];
        
        [formatter setDateFormat:@"H:mm"];
        return [NSString stringWithFormat:@"前天 %@", [formatter stringFromDate:date]];
    }
    
    if (year == yearNow) {
        
        NSDateFormatter     *formatter      = [[NSDateFormatter alloc] init];
        
        [formatter setDateFormat:@"H:mm"];
        return [NSString stringWithFormat:@"%d月%d日 %@", (int)month, (int)day, [formatter stringFromDate:date]];
    }
    
    NSDateFormatter     *formatter      = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"H:mm"];
    return [NSString stringWithFormat:@"%d年%d月%d日 %@", (int)year, (int)month, (int)day, [formatter stringFromDate:date]];
}

@end
