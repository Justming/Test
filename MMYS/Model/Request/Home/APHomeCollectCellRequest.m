//
//  APHomeCollectCellRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/8.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APHomeCollectCellRequest.h"

@implementation APHomeCollectCellRequest

- (id)initWithPageIndex:(NSInteger)page andPageSize:(NSInteger)size andSpecialGoodsID:(NSString *)specialID
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
        
        if (specialID) {
            [bodyDict setObject:specialID forKey:@"special_uuid"];
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
    return @"special/goodsList";
}

@end
