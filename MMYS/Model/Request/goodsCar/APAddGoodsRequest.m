//
//  APAddGoodsRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/9.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APAddGoodsRequest.h"

@implementation APAddGoodsRequest

- (id)initWithSkuID:(NSString *)sku_id andNumber:(NSInteger)num andMode:(NSString *)mode
{
    self = [super init];
    if (self)
    {
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (sku_id) {
            [bodyDict setObject:sku_id forKey:@"sku_uuid"];
        }
        
        if (num) {
            [bodyDict setObject:@(num) forKey:@"number"];
        }
        
        if (mode) {
            [bodyDict setObject:mode forKey:@"mode"];
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
    return @"car/add";//添加货物
}

@end
