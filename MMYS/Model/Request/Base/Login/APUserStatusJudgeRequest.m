//
//  APUserStatusJudgeRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/31.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APUserStatusJudgeRequest.h"

@implementation APUserStatusJudgeRequest

- (id)initWithPhone:(NSString *)phone
{
    self = [super init];
    if (self) {
        
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (phone && [phone isKindOfClass:[NSString class]]) {
            
            [bodyDict setObject:phone forKey:@"phone"];
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
    //return @"user/login/isTrue";//判断用户是否注册
    return @"api/user/send_code";
}

@end
