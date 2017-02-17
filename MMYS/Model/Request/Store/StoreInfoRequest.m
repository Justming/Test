//
//  StoreInfoRequest.m
//  MMYS
//
//  Created by Huasheng on 2017/2/17.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "StoreInfoRequest.h"

@implementation StoreInfoRequest
{
    NSString *shop_uuid;
}


- (id)initWithShopUuid:(NSString *)shopUuid
{
    
    if (self = [super init])
    {
        shop_uuid = shopUuid;
    }
    return self;
}


- (NSString *)methodPath
{
    
    return [NSString stringWithFormat:@"api/shop/shop_detail/%@", shop_uuid];
}

@end
