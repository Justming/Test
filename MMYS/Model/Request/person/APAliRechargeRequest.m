//
//  APAliRechargeRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/9/8.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APAliRechargeRequest.h"

@implementation APAliRechargeRequest

- (id)initWithAliRecharge:(NSString *)recharge
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
    return @"ap/recharge";//支付宝充值下单
}

@end
