//
//  APModifyGoodsNumRequest.h
//  apparel
//
//  Created by JamHonyZ on 16/8/11.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"

@interface APModifyGoodsNumRequest : FitBaseRequest

- (id)initWithPurchaseCarUUID:(NSString *)purchase_car_uuid andNumber:(NSInteger)num;

@end
