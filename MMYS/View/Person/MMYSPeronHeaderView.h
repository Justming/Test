//
//  MMYSPeronHeaderView.h
//  MMYS
//
//  Created by yangl on 2017/1/22.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMYSPersonHeaderDelegate <NSObject>

- (void)tapNextPage:(NSInteger)tagIndex;

@end

@interface MMYSPeronHeaderView : UIView

@property(nonatomic, strong) id <MMYSPersonHeaderDelegate> delegate;

@end
