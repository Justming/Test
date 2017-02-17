//
//  APWeiXinPayRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/19.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APWeiXinPayRequest.h"

@implementation APWeiXinPayRequest

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
    return @"wechat/place";//微信下单
}

@end
