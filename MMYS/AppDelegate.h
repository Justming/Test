//
//  AppDelegate.h
//  firefly
//
//  Created by Huasheng on 16/1/9.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuickLook/QuickLook.h>
#import <MBProgressHUD.h>
#import "GeTuiSdk.h"

@interface AppDelegate : UIResponder
<
UIApplicationDelegate,
QLPreviewControllerDataSource,
MBProgressHUDDelegate,
GeTuiSdkDelegate
>

@property (strong, nonatomic) UIWindow  *window;
@property (retain, nonatomic) NSString  *deviceToken;

@end

