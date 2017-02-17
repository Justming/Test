//
//  APSystemMessageRequest.h
//  apparel
//
//  Created by JamHonyZ on 16/8/23.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"

@interface APSystemMessageRequest : FitBaseRequest

- (id)initWithSystemMessage:(NSInteger)pageIndex andPageSize:(NSInteger)pageSize;

@end
