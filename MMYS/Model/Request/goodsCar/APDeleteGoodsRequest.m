//
//  APDeleteGoodsRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/17.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APDeleteGoodsRequest.h"

@implementation APDeleteGoodsRequest

- (id)initWithPurchaseCarUUID:(NSArray *)purchase_car_uuid
{
    self = [super init];
    if (self)
    {
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (purchase_car_uuid) {
            
            [bodyDict setObject:purchase_car_uuid forKey:@"purchase_car_uuid"];
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
    return @"car/delete";//删除商品
}

@end
