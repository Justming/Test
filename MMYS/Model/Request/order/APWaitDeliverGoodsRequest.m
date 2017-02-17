//
//  APWaitDeliverGoodsRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/9.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APWaitDeliverGoodsRequest.h"

@implementation APWaitDeliverGoodsRequest

- (id)initWithGoodsState:(NSInteger)state//待发货
{
    self = [super init];
    if (self)
    {
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
       
        [bodyDict setObject:@(state) forKey:@"order_status"];
        
        
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
    return @"order/wait";
}

@end
