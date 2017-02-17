//
//  APAddGoodsRequest.h
//  apparel
//
//  Created by JamHonyZ on 16/8/9.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"

@interface APAddGoodsRequest : FitBaseRequest

- (id)initWithSkuID:(NSString *)sku_id andNumber:(NSInteger)num andMode:(NSString *)mode;

@end
