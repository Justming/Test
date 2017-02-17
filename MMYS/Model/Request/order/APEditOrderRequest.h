//
//  APEditOrderRequest.h
//  apparel
//
//  Created by JamHonyZ on 16/8/30.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"

@interface APEditOrderRequest : FitBaseRequest

- (id)initWithReturnOrderUuid:(NSString *)return_order_uuid andWaybillNumber:(NSString *)waybill_number;
@end
