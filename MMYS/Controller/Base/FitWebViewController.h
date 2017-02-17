
//
//  FitWebViewController.h
//  FitTrainer
//
//  Created by Huasheng on 15/8/21.
//  Copyright (c) 2015年 Huasheng. All rights reserved.
//

#import "FitBaseViewController.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialSinaHandler.h"
#import <MessageUI/MessageUI.h>
#import<MessageUI/MFMailComposeViewController.h>

@interface FitWebViewController : FitBaseViewController
<
UIWebViewDelegate,
UMSocialUIDelegate,
MFMailComposeViewControllerDelegate,
MFMessageComposeViewControllerDelegate
>

@property   (assign, nonatomic)     BOOL            ifShare;
@property   (assign, nonatomic)     BOOL            scalePageToFit;
@property   (retain, nonatomic)     UIWebView       *webView;

- (id)initWithURL:(NSString *)url
         andTitle:(NSString *)title;

@end
