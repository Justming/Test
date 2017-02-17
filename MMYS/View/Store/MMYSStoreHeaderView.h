//
//  MMYSStoreHeaderView.h
//  MMYS
//
//  Created by yangl on 2017/1/21.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMYSStoreHeaderDelegate <NSObject>

- (void)gotoNextPage:(NSInteger) tagIndex;

@end

@interface MMYSStoreHeaderView : UIView

@property (nonatomic, strong) id<MMYSStoreHeaderDelegate> delegate;

- (void)addStoreInfoWithData:(NSDictionary *)storeInfo;


@end
