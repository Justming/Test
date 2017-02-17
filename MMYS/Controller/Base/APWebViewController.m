//
//  UserProtocolViewController.m
//  CPai
//
//  Created by JamHonyZ on 16/5/24.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APWebViewController.h"

@interface APWebViewController ()
<
UIWebViewDelegate
>
{
    UIActivityIndicatorView *_indicator;
}
@property   (retain, nonatomic)     UIWebView       *webView;
@end

@implementation APWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI
{
    self.title=_titlePage;
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-(kNaviHeight+kStatuBarHeight))];
    _webView.delegate = self;
//    _webView.scalesPageToFit    = _scalePageToFit;
    _webView.backgroundColor = BG_GRAY_COLOR;
    [self.view addSubview:_webView];
    
    if (self.networkUrl) {
         NSURLRequest *request =[NSURLRequest
                            requestWithURL:[NSURL URLWithString:self.networkUrl]];
        [_webView loadRequest:request];
    }
 }

#pragma mark webView delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request
                                                 navigationType:(UIWebViewNavigationType)navigationType
{
    NSString    *requestString  = [[request URL] absoluteString];
    if (!requestString || [requestString isEqualToString:@""])
    {
        return YES;
    }
    
    NSRange  campRange  = [requestString rangeOfString:@"close_web"];
    if (campRange.location != NSNotFound)
    {
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
    [_indicator stopAnimating];
    _indicator.hidden   = YES;
}
@end
