//
//  APHomeDetailRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/8.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APHomeDetailRequest.h"

@implementation APHomeDetailRequest
{
    NSString *_goodsUUID;
}
- (id)initWithGoodsUUID:(NSString *)goodsUUID
{
    self = [super init];
    if (self)
    {
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (goodsUUID) {
            _goodsUUID=goodsUUID;
            [bodyDict setObject:goodsUUID forKey:@"goods_uuid"];
        }
        
        NSMutableDictionary     *paramsDict = [self params];
        [paramsDict setObject:bodyDict forKey:@"body"];
    }
    
    return self;

}

- (NSString *)methodPath
{
    return [NSString stringWithFormat:@"goods/show/%@",_goodsUUID];
}
@end
