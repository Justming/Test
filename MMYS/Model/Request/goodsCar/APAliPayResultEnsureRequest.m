//
//  APAliPayResultEnsureRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/26.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APAliPayResultEnsureRequest.h"

@implementation APAliPayResultEnsureRequest

- (id)initWithMyOrderUuid:(NSString *)myOrderUuid andAlipayResult:(NSDictionary *)alipayResult
{
    self = [super init];
    if (self)
    {
        
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (myOrderUuid) {
            [bodyDict setObject:myOrderUuid forKey:@"myOrderUuid"];
        }
        
        if (alipayResult) {
            [bodyDict setObject:alipayResult forKey:@"alipayResult"];
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
    return @"alipay/confirm";//支付宝支付结果确认
}

@end
