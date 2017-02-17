//
//  APAlipayRequest.h
//  apparel
//
//  Created by JamHonyZ on 16/8/23.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"

@interface APAlipayRequest : FitBaseRequest

- (id)initWithPurchaseCarUUID:(NSArray *)purchase_car_uuid
                andTotalMoney:(NSString *)totalMoney
                 andTakeScore:(NSString *)takeScore
               andTakeBalance:(NSString *)takeBalance;

@end
