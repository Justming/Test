//
//  APMergePayRequest.h
//  apparel
//
//  Created by JamHonyZ on 16/8/19.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"

@interface APMergePayRequest : FitBaseRequest

- (id)initWithPurchaseCarUUID:(NSArray *)purchase_car_uuid
                 anduseScores:(NSString *)useScores
                anduseBalance:(NSString *)useBalance;
@end
