//
//  APAliRechargeResultRequest.h
//  apparel
//
//  Created by JamHonyZ on 16/9/8.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"

@interface APAliRechargeResultRequest : FitBaseRequest

- (id)initWithMyOrderUuid:(NSString *)myOrderUuid andAlipayResult:(NSDictionary *)alipayResult;
@end
