//
//  MultLookBigImageView.h
//  apparel
//
//  Created by JamHonyZ on 16/9/21.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJLoopView.h"

@interface MultLookBigImageView : UIView

-(void)scrollViewImageArray:(NSArray *)array andOffset:(NSInteger)offset Delegate:(id<WJLoopViewDelegate>)delegate;

@end
