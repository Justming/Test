//
//  FitLoginRequest.m
//  Baby
//
//  Created by Huasheng on 15/12/26.
//  Copyright © 2015年 Huasheng. All rights reserved.
//

#import "FitLoginRequest.h"

@implementation FitLoginRequest
{
    NSString    *_phone;
    NSString    *_captcha;
}

- (id)initWithPhone:(NSString *)phone
        andPassword:(NSString *)password
         andCaptcha:(NSString *)captcha
{
    self = [super init];
    if (self) {
        
        if (phone && [phone isKindOfClass:[NSString class]]) {
            _phone  = phone;
            _captcha   = captcha;
        }
//请求为POST，则对数据进行打包
//        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
//        
//        if (phone && [phone isKindOfClass:[NSString class]]) {
//            
//            [bodyDict setObject:phone forKey:@"phone"];
//        }
//        
//        if (password && [password isKindOfClass:[NSString class]]) {
//            [bodyDict setObject:password forKey:@"password"];
//        }
//        
//        if (captcha && [captcha isKindOfClass:[NSString class]]) {
//            [bodyDict setObject:captcha forKey:@"captcha"];
//        }
//        
//        NSMutableDictionary     *paramsDict = [self params];
//        [paramsDict setObject:bodyDict forKey:@"body"];
    }
    
    return self;
}


- (NSString *)methodPath
{
    //return @"user/login";
    return [NSString stringWithFormat:@"api/user/user_login/%@/%@", _phone, _captcha];
}

@end
