//
//  APWXRechargeRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/9/8.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APWXRechargeRequest.h"

@implementation APWXRechargeRequest

- (id)initWithWXRecharge:(NSString *)recharge
{
    self = [super init];
    if (self)
    {
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (recharge) {
            [bodyDict setObject:recharge forKey:@"totalMoney"];
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
    return @"wx/recharge";//微信充值下单
}

@end
