//
//  FitLoginController.m
//  BabTrainer
//
//  Created by Huasheng on 15/8/21.
//  Copyright (c) 2015年 Huasheng. All rights reserved.
//

#import "FitLoginController.h"
#import "FitConsts.h"
#import "NSString+StringHelper.h"
#import "FitNavigationController.h"
#import "ImageHelpTool.h"
#import "FitUserManager.h"
#import "FitTabbarController.h"
#import "FitLoginRequest.h"
#import "FitCaptchaRequest.h"
#import "APUserStatusJudgeRequest.h"
#define TOKEN @"apparel2016"
#import "APWebViewController.h"

@implementation FitLoginController
{
    UITextField     *_phoneTF;
    UITextField     *_codeTF;
    NSString        *_uuid;
    NSString        *_password;
    UILabel         *codeBtn;
    NSTimer         *_timer;
    BOOL            _ifAgreen;
    int              _number;
    UIImageView     *_doneImg;
    UIButton        *_loginBtn;
}

+ (void)presentInViewController:(UIViewController *)viewController Animated:(BOOL)animated
{
    if (!viewController) {
        return;
    }
    FitLoginController      *loginVC     = [[FitLoginController alloc] init];
    FitNavigationController *navVC      = [[FitNavigationController alloc] initWithRootViewController:loginVC];
    [viewController presentViewController:navVC animated:animated completion:^{
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden  = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden  = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createUI];
    _number             = 60;
}

- (void)createUI
{
    [super createUI];
    [self.navigationController.navigationBar setHidden:YES];
    
    UIImageView     *logo    = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth/3, kScreenHeight/9, kScreenWidth/3, kScreenWidth/3*166/158)];
    [logo setImage:[UIImage imageNamed:@"loginLogo"]];
    [self.view addSubview:logo];
    
    self.tableView.tableHeaderView      = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenWidth/3+60)];
    self.tableView.keyboardDismissMode  = UIScrollViewKeyboardDismissModeOnDrag;
    self.tableView.separatorInset   = UIEdgeInsetsMake(0, kScreenWidth, 0, 0);
    self.tableView.backgroundColor  = [UIColor clearColor];
    
    self.navigationItem.leftBarButtonItem = nil;
    
    UILabel *hintLbl    = [[UILabel alloc] init];
    hintLbl.frame = CGRectMake(0, kScreenHeight-50, kScreenWidth, 50);
    hintLbl.textColor   = [UIColor redColor];
    hintLbl.textAlignment   = NSTextAlignmentCenter;
    hintLbl.font                             =  TEXT_FONT_LEVEL_2;
    hintLbl.text                             = @"点击登录即理解并且同意《米麦云商服务协议》";
    hintLbl.userInteractionEnabled           = YES;
    [self.view addSubview:hintLbl];
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:hintLbl.text];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, 11)];
    hintLbl.attributedText = str;
    
    UITapGestureRecognizer   *hintLblTap     = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hintLblTap)];
    [hintLbl addGestureRecognizer:hintLblTap];
}

#pragma mark 隐私条款执行方法

- (void)hintLblTap
{
    APWebViewController   *webVC  = [[APWebViewController alloc] init];
     webVC.titlePage=@"服务协议";
    webVC.networkUrl=@"http://120.26.120.57:8080/apparel/legal.html";
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)doneImgTapped
{
    _ifAgreen = !_ifAgreen;
    
    if (_ifAgreen) {
        _doneImg.image = [UIImage imageNamed:@"duihao"];
    } else {
        _doneImg.image = [UIImage imageNamed:@"blank"];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 100;
    }
    if (indexPath.row == 1) {
        return 70;
    }
    if (indexPath.row == 2) {
        return 180;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString    *CELL_IDENTIFI  = @"CELL_IDENTIFI";
    
    UITableViewCell *cell   = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_IDENTIFI];
    
    cell.selectionStyle     = UITableViewCellSelectionStyleNone;
    cell.userInteractionEnabled = YES;
    cell.backgroundColor        = [UIColor clearColor];
    
    if (indexPath.row == 0) {
        _phoneTF                = [[UITextField alloc] initWithFrame:CGRectMake(20, 50, kScreenWidth - 120, 50)];
        _phoneTF.keyboardType   = UIKeyboardTypePhonePad;
        _phoneTF.placeholder    = @"请输入手机号码";
        _phoneTF.delegate       = self;
        _phoneTF.textColor      = [UIColor blackColor];
        [_phoneTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
        
        [cell.contentView addSubview:_phoneTF];
        
        UIView *botLine = [[UIView alloc] initWithFrame:CGRectMake(20, 99, kScreenWidth - 40, 0.5)];
        
        botLine.backgroundColor = LINE_COLOR;
        [cell.contentView addSubview:botLine];
    }
    
    if (indexPath.row == 1) {
        _codeTF = [[UITextField alloc] initWithFrame:CGRectMake(20, 10, kScreenWidth - 120, 50)];
        _codeTF.placeholder     = @"请输入验证号码";
//        _codeTF.font = [UIFont systemFontOfSize:17];
        _codeTF.keyboardType    = UIKeyboardTypePhonePad;
        _codeTF.delegate = self;
        _codeTF.tag = 0412;
        [_codeTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
        
        _codeTF.textColor       = [UIColor blackColor];
        
        [cell.contentView addSubview:_codeTF];
        
        UILabel     *lbl    = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth - 130, 10, 10, 50)];
        
        lbl.text            = @"/";
        lbl.font            = [UIFont boldSystemFontOfSize:18];
        lbl.textColor       = [UIColor redColor];
        lbl.textAlignment   = NSTextAlignmentCenter;
        
        [cell.contentView addSubview:lbl];
        
        codeBtn                    = [[UILabel alloc]init];
        codeBtn.layer.cornerRadius = 5;
        codeBtn.frame              = CGRectMake(kScreenWidth - 120, 10, 100, 50);
        codeBtn.text               = @"获取验证码";
        codeBtn.textColor          = RED_CLOOR;
        codeBtn.userInteractionEnabled = YES;
        codeBtn.clipsToBounds      = YES;
        codeBtn.textAlignment      = NSTextAlignmentCenter;
        codeBtn.font                = TEXT_FONT_LEVEL_1;
        UITapGestureRecognizer      *codeButTap    = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(judgeUserStatus)];
        
        [codeBtn addGestureRecognizer:codeButTap];
        [cell.contentView addSubview:codeBtn];
        
        UIView *botLine = [[UIView alloc] initWithFrame:CGRectMake(20, 59, kScreenWidth - 40, 0.5)];
        
        botLine.backgroundColor = LINE_COLOR;
        [cell.contentView addSubview:botLine];
        
    }
    if (indexPath.row == 2) {
        
        _loginBtn   = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.titleLabel.textColor  = [UIColor whiteColor];
        [_loginBtn setBackgroundColor:RED_CLOOR];
        _loginBtn.frame  = CGRectMake(15, 60, kScreenWidth - 30, 45);
        _loginBtn.layer.cornerRadius    = 5.0f;
        _loginBtn.clipsToBounds         = YES;
        
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(submitBtnPressed) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.contentView addSubview:_loginBtn];

    }
    
    return cell;
}

#pragma mark 发送验证码60s倒计时执行方法

- (void)timeFireMethod
{
    codeBtn.font                  = [UIFont systemFontOfSize:13];
    codeBtn.text                  = [NSString stringWithFormat:@"%ds内重新发送",_number--];
    if (_number == 0)
    {
        [_timer invalidate];
        codeBtn.userInteractionEnabled = YES;
        codeBtn.text        = @"发送验证码";
        codeBtn.font        = TEXT_FONT_LEVEL_1;
        _number             = 60;
    }
}

#pragma mark 判断用户是否注册（获取验证码之前）

-(void)judgeUserStatus
{
    //  手机号正则
    NSString *mobileRegex = @"[1][34578][0-9]{9}";
    NSPredicate *mobilePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileRegex];
    
    if (!_phoneTF.text || ![mobilePredicate evaluateWithObject:_phoneTF.text]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请输入正确的手机号码"
                                                        message:@""
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return;
    }

    if (![CheckUtils isLink]) {
        
        [self textStateHUD:@"无网络连接"];
        return;
    }

    
    //发送验证码请求
    [self senderCodeRequest];
    
}


#pragma mark 获取验证码按钮执行函数

- (void)senderCodeRequest
{
    if (![CheckUtils isLink]) {
        
        [self textStateHUD:@"无网络连接"];
        return;
    }
    
    //    倒计时60秒 同时 发送验证码按钮失去响应
    _timer                                            = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    codeBtn.userInteractionEnabled                    = NO ;
    
    FitCaptchaRequest    *request    = [[FitCaptchaRequest alloc] initWithPhone:_phoneTF.text];
    
    HTTPProxy   *proxy  = [HTTPProxy loadWithRequest:request
                                           completed:^(NSString *resp, NSStringEncoding encoding) {
                                               
                                               [self performSelectorOnMainThread:@selector(parseResponse:)
                                                                      withObject:resp
                                                                   waitUntilDone:YES];
                                           } failed:^(NSError *error) {
                                               
                                               [self performSelectorOnMainThread:@selector(textStateHUD:)
                                                                      withObject:@"获取验证码失败"
                                                                   waitUntilDone:YES];
                                           }];
    [proxy start];
  
}

#pragma mark  获取验证码响应方法

- (void)parseResponse:(NSString *)resp
{
    NSDictionary    *bodyDict   = [VOUtil parseBody:resp];
    
    if (!bodyDict) {
        [self textStateHUD:@"获取验证码失败"];
        return;
    }
    
    NSString *result    = [bodyDict objectForKey:@"result"];
    
    if (result && [result intValue] == 0) {
        
        [self textStateHUD:@"验证码已发送"];
        
        [_codeTF becomeFirstResponder];
        
    } else {
        
        if ([bodyDict objectForKey:@"description"] && [[bodyDict objectForKey:@"description"] isKindOfClass:[NSString class]]) {
            
            [self textStateHUD:[bodyDict objectForKey:@"description"]];
        } else {
            
            [self textStateHUD:@"获取验证码失败"];
        }
    }
}

#pragma mark 登录按钮执行函数

- (void)submitBtnPressed
{
    [self.view endEditing:YES];
    
    if ([_phoneTF.text isEqualToString:@""]) {
        [self textStateHUD:@"请输入手机号"];
        return;
    }
    
    if ([_codeTF.text isEqualToString:@""]) {
        [self textStateHUD:@"请输入验证码"];
        return;
    }
    //验证码正则
    NSString    *verCodeRegex     = @"[0-9]{6}";
    NSPredicate *verCodePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", verCodeRegex];
    
    if (!_codeTF.text || ![verCodePredicate evaluateWithObject:_codeTF.text]) {
        [self textStateHUD:@"验证码有误"];
        return;
    }
    
    if (![CheckUtils isLink]) {
        
        [self textStateHUD:@"无网络连接"];
        return;
    }
    
    _password   = [self generatePassword:_phoneTF.text];
    
    FitLoginRequest *request    = [[FitLoginRequest alloc]initWithPhone:_phoneTF.text andPassword:_password andCaptcha:_codeTF.text];
    
    HTTPProxy   *proxy  = [HTTPProxy loadWithRequest:request
                                           completed:^(NSString *resp, NSStringEncoding encoding) {
                                               
                                               [self performSelectorOnMainThread:@selector(parseCodeResponse:)
                                                                      withObject:resp
                                                                   waitUntilDone:YES];
                                           } failed:^(NSError *error) {
                                               
                                               [self performSelectorOnMainThread:@selector(textStateHUD:)
                                                                      withObject:@"登录失败"
                                                                   waitUntilDone:YES];
                                           }];
    [proxy start];

   
}

#pragma mark 登录按钮的响应函数

- (void)parseCodeResponse:(NSString *)resp
{
    NSDictionary    *bodyDict   = [VOUtil parseBody:resp];
    
    if (!bodyDict) {
        [self textStateHUD:@"登录失败"];
        return;
    }
    NSString *result    = [bodyDict objectForKey:@"result"];
    
    if (result && [result intValue] == 0)
    {

        _uuid       = [bodyDict objectForKey:@"uuid"];
        
        //保存用户信息（其中积分，余额，和是否设置提现密码通过另一种方式保存，后边有刷新）
        [self setUserInfo:nil andIntegral:nil andMerchant_name:nil andHasCashPswd:nil andPartnerPhone:nil andMerchant_status:nil];
                
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } else {
        
        [self textStateHUD:@"登录失败"];
    }
}
//——————————————————————————————————————————————————————————————————————————/

- (NSString *)generatePassword:(NSString *)phone
{
    NSDateFormatter *formatter  = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-DD hh:ii:ss"];
        NSString    *password   = [NSString stringWithFormat:@"%@%@%@", [formatter stringFromDate:[NSDate date]], phone, TOKEN];
    
    return password.md5;
}

//——————————————————————————————————————————————————————————————————————————/

#pragma mark 登记新用户信息

- (void)setUserInfo:(NSString *)balance andIntegral:(NSString *)integral andMerchant_name:(NSString *)merchant_name andHasCashPswd:(NSString *)hasCashPswd andPartnerPhone:(NSString *)partnerPhone andMerchant_status:(NSString *)merchant_status{
    
    NSMutableDictionary *userInfo   = [NSMutableDictionary new];
    
    if (_uuid) {
        [userInfo setObject:_uuid forKey:@"uuid"];
    }
    
    if (_phoneTF.text) {
        [userInfo setObject:_phoneTF.text forKey:@"phone"];
    }
    
    if (_password) {
        [userInfo setObject:_password forKey:@"password"];
    }
    
        [userInfo setObject:@"0" forKey:@"isCoach"];
    
    [[FitUserManager sharedUserManager] updateUserInfo:userInfo];
}


@end

