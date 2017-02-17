//
//  RegisterRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/8.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "RegisterRequest.h"

@implementation RegisterRequest

- (id)initWithPhone:(NSString *)phone
        andPassword:(NSString *)password
         andCaptcha:(NSString *)captcha
    andPartnerPhone:(NSString *)partnerPhone
{
    self = [super init];
    if (self) {
        
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (phone && [phone isKindOfClass:[NSString class]]) {
            
            [bodyDict setObject:phone forKey:@"phone"];
        }
        
        if (password && [password isKindOfClass:[NSString class]]) {
            [bodyDict setObject:password forKey:@"password"];
        }
        
        if (captcha && [captcha isKindOfClass:[NSString class]]) {
            [bodyDict setObject:captcha forKey:@"captcha"];
        }
        
        if (partnerPhone && [partnerPhone isKindOfClass:[NSString class]]) {
            [bodyDict setObject:partnerPhone forKey:@"partnerPhone"];
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
    return @"user/login";
}


@end
