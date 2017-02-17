//
//  APServiceRequest.h
//  apparel
//
//  Created by JamHonyZ on 16/8/9.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"

@interface APServiceRequest : FitBaseRequest

- (id)initWithAfterSaleGoodsPageIndex:(NSInteger)pageIndex andPageSize:(NSInteger)pageSize;
;

@end
