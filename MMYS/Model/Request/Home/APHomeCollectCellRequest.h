//
//  APHomeCollectCellRequest.h
//  apparel
//
//  Created by JamHonyZ on 16/8/8.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"

@interface APHomeCollectCellRequest : FitBaseRequest

- (id)initWithPageIndex:(NSInteger)page andPageSize:(NSInteger)size andSpecialGoodsID:(NSString *)specialID;
@end
