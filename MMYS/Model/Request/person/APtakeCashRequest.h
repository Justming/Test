//
//  APtakeCashRequest.h
//  apparel
//
//  Created by JamHonyZ on 16/8/15.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"

@interface APtakeCashRequest : FitBaseRequest

- (id)initWithMerchantsPayTreasure:(NSString *)merchants_pay_treasure
                    andTakeBalance:(NSString*)takeBalance
                      andTakeScore:(NSInteger)takeScore
                andPresentPassword:(NSString *)present_password;

@end
