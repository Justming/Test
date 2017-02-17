//
//  APAssistApplyRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/25.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APAssistApplyRequest.h"

@implementation APAssistApplyRequest

- (id)init
{
    self = [super init];
    if (self) {
        
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
    return @"user/assist";//协助认证
}

@end
