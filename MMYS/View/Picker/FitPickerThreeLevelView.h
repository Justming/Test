//
//  FitPickerThreeLevelView.h
//  apparel
//
//  Created by JamHonyZ on 16/9/20.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FitProtocols.h"

@interface FitPickerThreeLevelView : UIView
<
UIPickerViewDataSource,
UIPickerViewDelegate
>
@property(nonatomic,strong) UIView   *viewMask;
@property(nonatomic,strong)UIPickerView * pickerView;

@property   (weak,   nonatomic)     id<FitPickerViewDelegate>   delegate;

@end
