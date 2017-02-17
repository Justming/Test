//
//  APWeiXinPaySuccessRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/24.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APWeiXinPaySuccessRequest.h"

@implementation APWeiXinPaySuccessRequest

- (id)initWithMyOrderUuid:(NSString *)myOrderUuid
{
    self = [super init];
    if (self)
    {
        
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (myOrderUuid) {
            [bodyDict setObject:myOrderUuid forKey:@"myOrderUuid"];
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
    return @"wechat/confirm";//微信支付结果确认
}


@end
