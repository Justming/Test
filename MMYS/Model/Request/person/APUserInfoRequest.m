//
//  APUserInfoRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/28.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APUserInfoRequest.h"

@implementation APUserInfoRequest

- (id)init
{
    self = [super init];
    if (self)
    {
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
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
    return @"user/information";//获取用户信息
}

@end
