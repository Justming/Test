//
//  APResetCashPasswordRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/15.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APResetCashPasswordRequest.h"

@implementation APResetCashPasswordRequest

- (id)initWithPresentPassword:(NSString *)present_password
         andRepresentPassword:(NSString*)represent_password
                   andCaptcha:(NSString *)captcha
{
    self = [super init];
    if (self)
    {
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        
        if (present_password) {
            [bodyDict setObject:present_password forKey:@"present_password"];
        }
        if (represent_password) {
            [bodyDict setObject:represent_password forKey:@"represent_password"];
        }
        if (captcha) {
            [bodyDict setObject:captcha forKey:@"captcha"];
        }
        
        NSMutableDictionary     *paramsDict = [self params];
        [paramsDict setObject:bodyDict forKey:@"body"];
    }
    
    return self;
}

- (BOOL)isPost
{
    return YES;
}

- (NSString *)methodPath
{
    return @"reset/pswd";
}

@end
