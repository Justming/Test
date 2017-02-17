//
//  APHomeCellRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/8.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APHomeCellRequest.h"

@implementation APHomeCellRequest

- (id)initWithPageIndex:(NSInteger)page andPageSize:(NSInteger)size
{
    self = [super init];
    if (self)
    {
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (page) {
            
            [bodyDict setObject:@(page) forKey:@"pageIndex"];
        }
        
        if (size) {
            [bodyDict setObject:@(size) forKey:@"pageSize"];
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
    return @"special/list";
}

@end
