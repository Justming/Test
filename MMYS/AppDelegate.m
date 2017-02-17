//
//  AppDelegate.m
//  firefly
//
//  Created by Huasheng on 16/1/9.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "AppDelegate.h"
#import "FitTabbarController.h"
#import "FitNavigationController.h"
#import "FitLoginController.h"
#import "FitUserManager.h"
#import "FitPayloadManager.h"
#import "FitClientIDManager.h"
#import "UMMobClick/MobClick.h"
//支付宝
#import <AlipaySDK/AlipaySDK.h>
//微信支付
#import "WXApi.h"
#import "WXApiManager.h"

@implementation AppDelegate
{
    QLPreviewController *_preController;
    NSURL               *_dataPath;
    NSString            *_fileName;
}

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
//    if ([url.host isEqualToString:@"safepay"]) {
//        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"===AppDelegate 支付宝支付9.0以后处理支付结果====result = %@",resultDic);
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"aliPayEnsure" object:resultDic];
        }];
    return YES;
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return  [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    

        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"AppDelegate 支付宝支付，处理支付结果result = %@",resultDic);
                 [[NSNotificationCenter defaultCenter] postNotificationName:@"aliPayEnsure" object:resultDic];
        }];
    return [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // * 启动个推
    //
//    [self GexinProcess:launchOptions];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    FitTabbarController  *rootVC     = [[FitTabbarController alloc]init];
    
    [self.window setRootViewController:rootVC];
    [self.window makeKeyAndVisible];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
//    UMConfigInstance.appKey = @"578cb28fe0f55a454c003d66";
//    
//    [MobClick startWithConfigure:UMConfigInstance];
    
    //向微信注册
    [WXApi registerApp:@"wx3e5816b3356c97b9"];
    return YES;
}

//有文件传入时 调用
//- (BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
//{
//    //获取当前 显示controller
//    UIViewController *root = [[[UIApplication sharedApplication] keyWindow] rootViewController];
//    //获取当前controller present出的controller
//    if (root.presentedViewController) {
//        if ([root.presentedViewController isKindOfClass:[UINavigationController class]]) {
//            UINavigationController *navi = (UINavigationController *)root.presentedViewController;
//            UIViewController *currentController = navi.viewControllers[0];
//            if ([currentController isKindOfClass:[QLPreviewController class]]) {
//                [currentController dismissViewControllerAnimated:NO completion:^{
//                    
//                }];
//            }
//        }
//    }
//    
//    _dataPath = url;
//    NSData *fileData = [NSData dataWithContentsOfURL:url];
//    NSString *urlStr = [NSString stringWithFormat:@"%@", url];
//    //传入文件名字 以及类型后缀
//    _fileName = [urlStr componentsSeparatedByString:@"/"].lastObject;
//    //在文件存放在本地
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
//    NSString *path = [paths objectAtIndex:0];
//    NSString    *filename = [path stringByAppendingPathComponent:_fileName];
//    NSFileManager *fm = [NSFileManager defaultManager];
//    [fm createFileAtPath:filename contents:nil attributes:nil];
//    [fileData writeToFile:filename atomically:YES];
//    
//    _preController = [[QLPreviewController alloc] init];
//    _preController.dataSource = self;
////    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(disMissSelf)];
////    _preController.navigationItem.leftBarButtonItem = leftItem;
////    
////    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleBordered target:self action:@selector(saveInLocation)];
////    _preController.navigationItem.rightBarButtonItem = rightItem;
//    
//    _preController.currentPreviewItemIndex = 0;
//    
//    FitNavigationController *navi = [[FitNavigationController alloc] initWithRootViewController:_preController];
//    [self.window.rootViewController presentViewController:navi animated:YES completion:^{
//        
//    }];
//    
//    return YES;
//}
//


- (void)textStateHUD:(NSString *)text
{
    MBProgressHUD *stateHud = [[MBProgressHUD alloc] initWithView:_preController.view];
    stateHud.delegate = self;
    [_preController.view addSubview:stateHud];
    stateHud.mode = MBProgressHUDModeText;
    stateHud.opacity = 0.4;
    stateHud.labelText = text;
    stateHud.labelFont = [UIFont systemFontOfSize:12.0f];
    [stateHud show:YES];
    [stateHud hide:YES afterDelay:0.8];
}

- (NSInteger) numberOfPreviewItemsInPreviewController: (QLPreviewController *) controller
{
    return 1;
}

- (id)previewController:(QLPreviewController *)previewController previewItemAtIndex:(NSInteger)idx
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path = [paths objectAtIndex:0];
    NSString    *filename = [path stringByAppendingPathComponent:_fileName];
    NSURL *url = [NSURL fileURLWithPath:filename];
    return url;
}

- (void)saveInLocation
{
    //将数据缓存到本地
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filename = [path stringByAppendingPathComponent:@"fileList.plist"];
    
    NSArray *preFileArr = [NSArray arrayWithContentsOfFile:filename];
    NSMutableArray  *nowFileArr;
    if (preFileArr && preFileArr.count != 0) {
        nowFileArr = [NSMutableArray arrayWithArray:preFileArr];
    } else {
        nowFileArr = [[NSMutableArray alloc] initWithCapacity:0];
    }
    
    NSFileManager *fm = [NSFileManager defaultManager];
    [fm createFileAtPath:filename contents:nil attributes:nil];
    NSDictionary *saveDic = @{@"name":_fileName, @"time":[NSString stringWithFormat:@"%.1f",[[NSDate date] timeIntervalSince1970]]};
    
    [nowFileArr addObject:saveDic];
    BOOL ifSuccess = [nowFileArr writeToFile:filename atomically:YES];
    if (ifSuccess) {
        [self textStateHUD:@"保存成功"];
        [[NSNotificationCenter defaultCenter] postNotificationName:FIR_SAVEFILE_REFRESH_NOTIFICATION object:nil];
    } else {
        [self textStateHUD:@"保存失败"];
    }
}

- (void)disMissSelf
{
    [_preController dismissViewControllerAnimated:YES completion:^{
        
    }];
}
//当程序正在运行时 收到提醒事件时触发
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[notification.userInfo objectForKey:@"id"] message:notification.alertBody delegate:nil cancelButtonTitle:@"关闭" otherButtonTitles:notification.alertAction, nil];
    [alert show];
}



- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // * 将个推设为后台状态
    //
    
    [GeTuiSdk enterBackground];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

#pragma mark - APNS Process

//注册苹果通知
- (void)registerRemoteNotification
{
//#ifdef __IPHONE_8_0
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
//        
//        UIUserNotificationSettings *uns = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound) categories:nil];
//        [[UIApplication sharedApplication] registerForRemoteNotifications];
//        [[UIApplication sharedApplication] registerUserNotificationSettings:uns];
//    } else {
//        UIRemoteNotificationType apn_type = (UIRemoteNotificationType)(UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound|UIRemoteNotificationTypeBadge);
//        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:apn_type];
//    }
//#else
//    UIRemoteNotificationType apn_type = (UIRemoteNotificationType)(UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound|UIRemoteNotificationTypeBadge);
//    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:apn_type];
//#endif
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
//    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
//    _deviceToken = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
//    
//    
////    NSLog(@"--------_deviceToken:%@",_deviceToken);
//    
//    NSUserDefaults  *standDefaults  = [NSUserDefaults standardUserDefaults];
//    
//    [standDefaults setObject:_deviceToken forKey:@"deviceToken"];
//    
//    [standDefaults synchronize];
//    
//    [GeTuiSdk registerDeviceToken:_deviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
//    [GeTuiSdk registerDeviceToken:@""];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userinfo
{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    
//    [[UIApplication sharedApplication] cancelAllLocalNotifications];
//    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
//    
//    NSString *payloadMsg = [userInfo objectForKey:@"payload"];
//    
//    if (payloadMsg && [payloadMsg isKindOfClass:[NSString class]]) {
//        
//        [FitPayloadManager processPayload:payloadMsg];
//    }
//    
//    completionHandler(UIBackgroundFetchResultNewData);
}

#pragma mark - Getui Process

- (void)GexinProcess:(NSDictionary *)launchOptions
{
//    // [1]:使用APPID/APPKEY/APPSECRENT创建个推实例
//    [GeTuiSdk startSdkWithAppId:gtAppID appKey:gtAppKey appSecret:gtAppSecret delegate:self error:nil];
//    
//    // [2]:注册APNS
    [self registerRemoteNotification];
//
//    // [2-EXT]: 获取启动时收到的APN
//    NSDictionary* message = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
//    if (message) {
//        //        NSString *payloadMsg = [message objectForKey:@"payload"];
//        //        NSString *record = [NSString stringWithFormat:@"[APN]%@, %@", [NSDate date], payloadMsg];
//        //        if (payloadMsg && [payloadMsg isKindOfClass:[NSString class]]) {
//        //            [[hcb_PayloadManager sharedPayloadManager] processPayload:payloadMsg];
//        //        }
//    }
//    
//    [[UIApplication sharedApplication] cancelAllLocalNotifications];
//    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
}

#pragma mark - GexinSdkDelegate

//SDK启动成功返回cid
- (void) GeTuiSdkDidRegisterClient:(NSString *)clientId
{
    [[FitClientIDManager sharedClientIDManager] saveClientID:clientId];
//     NSLog(@"--------clientId:%@",clientId);
}

//SDK收到透传消息回调
- (void) GeTuiSdkDidReceivePayload:(NSString *)payloadId
                         andTaskId:(NSString*) taskId
                      andMessageId:(NSString*)aMsgId
                   fromApplication:(NSString *)appId
{
    // [4]: 收到个推消息
    NSData *payload = [GeTuiSdk retrivePayloadById:payloadId];
    NSString *payloadMsg = nil;
    if (payload) {
        
        
        
        payloadMsg = [[NSString alloc] initWithBytes:payload.bytes
                                              length:payload.length
                                            encoding:NSUTF8StringEncoding];
    }
    
    if (payloadMsg && [payloadMsg isKindOfClass:[NSString class]]) {
        
//        NSLog(@"---------payloadMsg------------%@",payloadMsg);
        
        [FitPayloadManager processTransPayload:payloadMsg];
    }
}

@end
