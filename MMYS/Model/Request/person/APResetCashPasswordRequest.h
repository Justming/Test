//
//  APResetCashPasswordRequest.h
//  apparel
//
//  Created by JamHonyZ on 16/8/15.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"

@interface APResetCashPasswordRequest : FitBaseRequest

- (id)initWithPresentPassword:(NSString *)present_password
         andRepresentPassword:(NSString*)represent_password
                   andCaptcha:(NSString *)captcha;
@end
