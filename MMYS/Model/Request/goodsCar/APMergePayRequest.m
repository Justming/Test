//
//  APMergePayRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/19.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APMergePayRequest.h"

@implementation APMergePayRequest

- (id)initWithPurchaseCarUUID:(NSArray *)purchase_car_uuid
                anduseScores:(NSString *)useScores
                 anduseBalance:(NSString *)useBalance
{
    self = [super init];
    if (self)
    {
        
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (purchase_car_uuid) {
            [bodyDict setObject:purchase_car_uuid forKey:@"purchase_car_uuid"];
        }
        if (useScores) {
            [bodyDict setObject:useScores forKey:@"useScores"];
        }
        if (useBalance) {
            [bodyDict setObject:useBalance forKey:@"useBalance"];
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
    return @"car/payment";//合并付款
}

@end
