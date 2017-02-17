//
//  FitWebViewController.m
//  FitTrainer
//
//  Created by Huasheng on 15/8/21.
//  Copyright (c) 2015年 Huasheng. All rights reserved.
//

#import "FitWebViewController.h"
#import "FitConsts.h"
#import "FitUserManager.h"
#import "AppDelegate.h"

@implementation FitWebViewController

{
    NSString                *_url;
    UIActivityIndicatorView *_indicator;
}

- (id)initWithURL:(NSString *)url andTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        
        _url        = url;
        self.title  = title;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createUI];
}

- (void)willMoveToParentViewController:(UIViewController *)parent
{

}

- (void)didMoveToParentViewController:(UIViewController *)parent
{
    if (!parent) {
        
        if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
            
            SEL selector = NSSelectorFromString(@"setOrientation:");
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
            [invocation setSelector:selector];
            [invocation setTarget:[UIDevice currentDevice]];
            int val = UIInterfaceOrientationPortrait;
            [invocation setArgument:&val atIndex:2];
            [invocation invoke];
        }
    }
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _webView.frame  = self.view.frame;
}

- (void)createUI
{
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _webView.delegate = self;
    _webView.scalesPageToFit    = _scalePageToFit;
    _webView.backgroundColor = BG_GRAY_COLOR;
    [self.view addSubview:_webView];
    
    _indicator  = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _indicator.center   = self.view.center;
    
    [self.view addSubview:_indicator];
    [_indicator startAnimating];
    
    if ([[FitUserManager sharedUserManager] isLogin]) {
        
        NSString *uuid      = [[FitUserManager sharedUserManager] uuid];
        NSString *param     = [NSString stringWithFormat:@"?uuid=%@", uuid];
        
        _url = [_url stringByAppendingString:param];
    }
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:_url]];
    
    [_webView loadRequest:request];
    
    if (_ifShare) {
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:UIBarButtonItemStylePlain target:self action:@selector(share)];
        self.navigationItem.rightBarButtonItem = rightItem;
    }
    
}

- (void)share
{

}

#pragma mark webView delegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString    *requestString  = [[request URL] absoluteString];
 
    if (!requestString || [requestString isEqualToString:@""]) {
        return YES;
    }
    
    NSRange     campRange       = [requestString rangeOfString:@"close_web"];
    
    if (campRange.location != NSNotFound) {
        [self.navigationController popViewControllerAnimated:YES];
        return NO;
    }
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_indicator stopAnimating];
    _indicator.hidden   = YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self textStateHUD:@"没有内容"];
    [_indicator stopAnimating];
    _indicator.hidden   = YES;
}



#pragma mark - FitShareView Delegate

//短信分享
- (void)doShareWithSMS
{
    if ([MFMessageComposeViewController canSendText] )//判断是否能发短息
    {
        MFMessageComposeViewController * controller = [[MFMessageComposeViewController alloc]init];
        controller.recipients = nil;//接收人
        controller.body = [NSString stringWithFormat:@"逆袭学院--%@ %@", self.title, _url];//短信内容,自定义即可
        controller.messageComposeDelegate = self;//设置代理
        
        [self presentViewController:controller animated:YES completion:nil];
    } else {
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"抱歉" message:@"短信功能不可用!" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil, nil, nil];
        [alert show];
    }
}

//发送短信后的回调
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller
                 didFinishWithResult:(MessageComposeResult)result
{
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    switch (result)
    {
        case MessageComposeResultCancelled:
        {
            //用户取消发送
        }
            break;
        case MessageComposeResultFailed://发送短信失败
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"抱歉" message:@"短信发送失败" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil, nil, nil];
            
            [alert show];
            
        }
            break;
        case MessageComposeResultSent:
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"恭喜" message:@"短信发送成功!" delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil, nil, nil];
            
            [alert show];
            
        }
            break;
        default:
            break;
    }
}

//微博分享
- (void)doShareWithSina
{
    [UMSocialData setAppKey:umShareAppKey];
//    [UMSocialSinaHandler openSSOWithRedirectURL:_url];
    [[UMSocialControllerService defaultControllerService] setShareText:[NSString stringWithFormat:@"逆袭学院--%@ %@", self.title, _url]
                                                            shareImage:[UIImage imageNamed:@"App_icon"]
                                                      socialUIDelegate:self];        //设置分享内容和回调对象
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
}

//分享腾讯微博
- (void)doShareWithTencent
{
    [UMSocialData setAppKey:umShareAppKey];
    [UMSocialSinaHandler openSSOWithRedirectURL:_url];
    [[UMSocialControllerService defaultControllerService] setShareText:[NSString stringWithFormat:@"逆袭学院--%@", self.title]
                                                            shareImage:[UIImage imageNamed:@"App_icon"]
                                                      socialUIDelegate:self];        //设置分享内容和回调对象
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToTencent].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
}

//分享微信
- (void)doShareWithWeChat
{
    [UMSocialData setAppKey:umShareAppKey];
    [UMSocialWechatHandler setWXAppId:@"wx027975c909c0604e" appSecret:@"0fa44d6e4ddb4c641742e6078c3b478b" url:_url];
    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeWeb;
    [UMSocialData defaultData].extConfig.title = @"逆袭学院--让你遇见更好的自己";
    [[UMSocialControllerService defaultControllerService] setShareText:[NSString stringWithFormat:@"逆袭学院--%@", self.title]
                                                            shareImage:[UIImage imageNamed:@"App_icon"]
                                                      socialUIDelegate:self]; //设置分享内容和回调对象
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
}

//分享朋友圈
- (void)doShareWithWeChatTimeLine
{
    [UMSocialData setAppKey:umShareAppKey];
    [UMSocialWechatHandler setWXAppId:@"wx027975c909c0604e" appSecret:@"0fa44d6e4ddb4c641742e6078c3b478b" url:_url];
    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeWeb;
    [UMSocialData defaultData].extConfig.title = [NSString stringWithFormat:@"逆袭学院--%@", self.title];
    [[UMSocialControllerService defaultControllerService] setShareText:[NSString stringWithFormat:@"逆袭学院--%@", self.title]
                                                            shareImage:[UIImage imageNamed:@"App_icon"]
                                                      socialUIDelegate:self]; //设置分享内容和回调对象
    [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatTimeline].snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
}

@end
