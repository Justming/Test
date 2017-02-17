
//
//  FitBaseViewController.h
//  FitTrainer
//
//  Created by Huasheng on 15/8/20.
//  Copyright (c) 2015年 Huasheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "FitConsts.h"
#import "FitProtocols.h"
#import "FitNotificationNames.h"
#import "VOUtil.h"
#import "HTTPProxy.h"
#import "CheckUtils.h"
#import "FitUserManager.h"
#import "UIImageView+WebCache.h"

@interface FitBaseViewController : UIViewController
<
MBProgressHUDDelegate
>
{
    MBProgressHUD *stateHud;
}

- (void)popSelf;
- (void)textStateHUD:(NSString *)text;
- (void)initStateHud;
- (void)hideStateHud;
- (void)resignCurrentFirstResponder;

@end
