//
//  APAliPayResultEnsureRequest.h
//  apparel
//
//  Created by JamHonyZ on 16/8/26.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"

@interface APAliPayResultEnsureRequest : FitBaseRequest

- (id)initWithMyOrderUuid:(NSString *)myOrderUuid andAlipayResult:(NSDictionary *)alipayResult;

@end
