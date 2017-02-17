//
//  APtakeCashRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/15.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APtakeCashRequest.h"

@implementation APtakeCashRequest

- (id)initWithMerchantsPayTreasure:(NSString *)merchants_pay_treasure
                    andTakeBalance:(NSString*)takeBalance
                      andTakeScore:(NSInteger)takeScore
                andPresentPassword:(NSString *)present_password
{
    self = [super init];
    if (self)
    {
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        
        if (merchants_pay_treasure) {
            [bodyDict setObject:merchants_pay_treasure forKey:@"merchants_pay_treasure"];
        }
        if (takeBalance) {
            [bodyDict setObject:takeBalance forKey:@"takeBalance"];
        }
        if (takeScore) {
            [bodyDict setObject:@(takeScore) forKey:@"takeScore"];
        }
        if (present_password) {
            [bodyDict setObject:present_password forKey:@"present_password"];
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
    return @"take/cash";
}


@end
