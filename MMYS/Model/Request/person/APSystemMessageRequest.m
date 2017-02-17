//
//  APSystemMessageRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/23.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APSystemMessageRequest.h"

@implementation APSystemMessageRequest

- (id)initWithSystemMessage:(NSInteger)pageIndex andPageSize:(NSInteger)pageSize

{
    self = [super init];
    if (self)
    {
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (pageIndex) {
            [bodyDict setObject:@(pageIndex) forKey:@"pageIndex"];
        }
        
        if (pageSize) {
            [bodyDict setObject:@(pageSize) forKey:@"pageSize"];
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
    return @"news/list";
}

@end
