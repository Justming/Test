//
//  UserProtocolViewController.h
//  CPai
//
//  Created by JamHonyZ on 16/5/24.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseViewController.h"
#import "FitConsts.h"

@interface APWebViewController : FitBaseViewController

//@property   (retain, nonatomic)     UIWebView       *webView;
@property   (strong, nonatomic)     NSString        *titlePage;

@property   (strong, nonatomic)     NSString        *networkUrl;
@end
