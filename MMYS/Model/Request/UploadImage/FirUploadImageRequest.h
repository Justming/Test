//
//  FirUploadImageRequest.h
//  firefly
//
//  Created by JamHonyZ on 16/1/20.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"
#import "FitConsts.h"
#import "FitUserManager.h"


@interface FirUploadImageRequest : FitBaseRequest

- (id)initWithFileName:(NSString *)filename;

@end
