//
//  APEditOrderRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/30.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APEditOrderRequest.h"

@implementation APEditOrderRequest

- (id)initWithReturnOrderUuid:(NSString *)return_order_uuid andWaybillNumber:(NSString *)waybill_number
{
    self = [super init];
    if (self)
    {
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (return_order_uuid) {
            [bodyDict setObject:return_order_uuid forKey:@"return_order_uuid"];
        }
        if (waybill_number) {
            [bodyDict setObject:waybill_number forKey:@"waybill_number"];
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

- (NSString *)methodPath//编辑运单
{
    return @"order/waybill";
}

@end
