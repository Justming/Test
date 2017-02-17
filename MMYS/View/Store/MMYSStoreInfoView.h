//
//  MMYSStoreInfoView.h
//  MMYS
//

//  Created by Huasheng on 2017/2/14.
//  Created by Huasheng on 2017/2/16.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMYSStoreHeaderDelegate <NSObject>

- (void)getHeaderFromPhoto;

@end


@interface MMYSStoreInfoView : UIView

@property (nonatomic, strong)UIImageView * headerImage;
@property (nonatomic, strong)id <MMYSStoreHeaderDelegate> delegate;


@end
