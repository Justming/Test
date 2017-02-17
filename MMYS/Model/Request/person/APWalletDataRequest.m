//
//  APWalletDataRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/19.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APWalletDataRequest.h"

@implementation APWalletDataRequest

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
    return @"self/wallet";//我的钱包
}

@end
