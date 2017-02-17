//
//  APOrderDetailRequest.h
//  apparel
//
//  Created by JamHonyZ on 16/8/9.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"

@interface APOrderDetailRequest : FitBaseRequest

- (id)initWithGoodsOrderUUID:(NSString *)orderUUID;

@end
