//
//  RegisterRequest.h
//  apparel
//
//  Created by JamHonyZ on 16/8/8.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"

@interface RegisterRequest : FitBaseRequest

- (id)initWithPhone:(NSString *)phone
        andPassword:(NSString *)password
         andCaptcha:(NSString *)captcha
    andPartnerPhone:(NSString *)partnerPhone;
@end
