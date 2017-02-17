//
//  APReturnGoodsRequest.h
//  apparel
//
//  Created by JamHonyZ on 16/8/9.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"

@interface APReturnGoodsRequest : FitBaseRequest

- (id)initWithGoodsOrderUUID:(NSString *)orderUUID andGoodsCarUUID:(NSString *)goodsCarUUID andReason:(NSString *)reason andNumber:(NSInteger)num;

@end
