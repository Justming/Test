//
//  APUpdateGoodsCarRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/26.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APUpdateGoodsCarRequest.h"

@implementation APUpdateGoodsCarRequest

- (id)init
{
    self = [super init];
    if (self)
    {
        
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
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
    return @"car/change";//更改库存
}

@end
