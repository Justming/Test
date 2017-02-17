//
//  APAlipayRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/23.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APAlipayRequest.h"

@implementation APAlipayRequest

- (id)initWithPurchaseCarUUID:(NSArray *)purchase_car_uuid
                andTotalMoney:(NSString *)totalMoney
                 andTakeScore:(NSString *)takeScore
               andTakeBalance:(NSString *)takeBalance
{
    self = [super init];
    if (self)
    {
        
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (purchase_car_uuid) {
            [bodyDict setObject:purchase_car_uuid forKey:@"purchase_car_uuid"];
        }
        if (totalMoney) {
            [bodyDict setObject:totalMoney forKey:@"totalMoney"];
        }
        if (takeScore) {
            [bodyDict setObject:@([takeScore floatValue]) forKey:@"takeScore"];
        }
        if (takeBalance) {
            [bodyDict setObject:@([takeBalance floatValue]) forKey:@"takeBalance"];
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
    return @"alipay/place";//支付宝下单
}

@end
