//
//  MMYSPersonInfoView.h
//  MMYS
//
//  Created by Huasheng on 2017/2/14.
//  Created by Huasheng on 2017/2/16.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMYSPersonInfoDelegate <NSObject>

- (void)changeHeaderImage:(NSInteger)tagIndex;

@end

@interface MMYSPersonInfoView : UIView

@property (nonatomic, strong) id <MMYSPersonInfoDelegate> delegate;
@property (nonatomic, strong) UIImageView * header;

@end
