
//
//  FitLoginController.h
//  BabTrainer
//
//  Created by Huasheng on 15/8/21.
//  Copyright (c) 2015年 Huasheng. All rights reserved.
//

#import "FitTableViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface FitLoginController : FitTableViewController
<
UITextFieldDelegate,
MBProgressHUDDelegate
>
@property (retain, nonatomic)NSString *staffID;

+ (void)presentInViewController:(UIViewController *)viewController Animated:(BOOL)animated;
@end
