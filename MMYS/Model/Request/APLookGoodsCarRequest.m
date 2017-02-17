//
//  APLookGoodsCarRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/9.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APLookGoodsCarRequest.h"

@implementation APLookGoodsCarRequest

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
    return @"car/show";
}

@end
