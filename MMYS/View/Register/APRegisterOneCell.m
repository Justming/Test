//
//  APRegisterOneCell.m
//  apparel
//
//  Created by JamHonyZ on 16/8/6.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APRegisterOneCell.h"
#import "FitConsts.h"
//#import "QRadioButton.h"


@implementation APRegisterOneCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    _messageView = [[APMessageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
    [self addSubview:_messageView];
    
    _nameTF = [[UITextField alloc] initWithFrame:CGRectMake(75, 5, kScreenWidth-85, 30)];
    _nameTF.placeholder=@"请输入真实姓名";
    _nameTF.font = TEXT_FONT_LEVEL_2;
    
    [_nameTF setKeyboardType:UIKeyboardTypeDefault];
    _nameTF.keyboardType=UIKeyboardTypeDefault;
    [_nameTF setReturnKeyType:UIReturnKeyDone];
    [_nameTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_messageView addSubview:_nameTF];
    
    _man = [[QRadioButton alloc]initWithDelegate:self groupId:@"remaind"];
    _man.frame = CGRectMake(120, 49, 50, 20);
    [_man setTitle:@"男" forState:UIControlStateNormal];
    [_man setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_man.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [_messageView addSubview:_man];
    _man.tag=0;
    [_man setChecked:YES];
    
    _woman = [[QRadioButton alloc]initWithDelegate:self groupId:@"remaind"];
    _woman.frame = CGRectMake(180, 49, 50, 20);
    [_woman setTitle:@"女" forState:UIControlStateNormal];
    [_woman setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_woman.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [_messageView addSubview:_woman];
    _woman.tag=1;
    [_woman setChecked:NO];
    
    _cardIdTF = [[UITextField alloc] initWithFrame:CGRectMake(75, 85, kScreenWidth-85, 30)];
    _cardIdTF.placeholder=@"请输入身份证号码";
    _cardIdTF.keyboardType=UIKeyboardTypeDefault;
    [_cardIdTF setReturnKeyType:UIReturnKeyDone];
    _cardIdTF.font = TEXT_FONT_LEVEL_2;
    [_cardIdTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_messageView addSubview:_cardIdTF];
    
    _storeNameTF = [[UITextField alloc] initWithFrame:CGRectMake(75, 125, kScreenWidth-85, 30)];
    _storeNameTF.placeholder=@"请输入门店名称";
    _storeNameTF.keyboardType=UIKeyboardTypeDefault;
    [_storeNameTF setReturnKeyType:UIReturnKeyDone];
    _storeNameTF.font = TEXT_FONT_LEVEL_2;
    [_storeNameTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_messageView addSubview:_storeNameTF];
    
    _menTF = [[UITextField alloc] initWithFrame:CGRectMake(75,165, kScreenWidth-85, 30)];
    _menTF.placeholder=@"请选择地址";
    _menTF.font = TEXT_FONT_LEVEL_2;
    [_menTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    _menTF.textColor = [UIColor blackColor];
    [_menTF setUserInteractionEnabled:NO];
    [_messageView addSubview:_menTF];
    
    _addressButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _addressButton.frame = CGRectMake(75, 165, kScreenWidth-85, 30);
    [_addressButton setUserInteractionEnabled:YES];
    [_messageView addSubview:_addressButton];
    
    _addressTF = [[UITextField alloc] initWithFrame:CGRectMake(75,205, kScreenWidth-85, 30)];
    _addressTF.placeholder=@"请输入详细信息";
    _addressTF.font = TEXT_FONT_LEVEL_2;
    _addressTF.keyboardType=UIKeyboardTypeDefault;
    [_addressTF setReturnKeyType:UIReturnKeyDone];
     [_addressTF setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    _addressTF.textColor = [UIColor blackColor];
    [_messageView addSubview:_addressTF];
    
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(75, 250, 20, 18)];
    [image setImage:[UIImage imageNamed:@"redDuiHao"]];
    [_messageView addSubview:image];
    
    _goodAddress = [[UITextField alloc] initWithFrame:CGRectMake(110,245, kScreenWidth-130, 30)];
    _goodAddress.placeholder=@"默认为门店地址，点击可修改";
    _goodAddress.font = TEXT_FONT_LEVEL_2;
    _goodAddress.keyboardType=UIKeyboardTypeDefault;
    [_goodAddress setReturnKeyType:UIReturnKeyDone];
    _goodAddress.textColor = [UIColor blackColor];
    [_goodAddress setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_messageView addSubview:_goodAddress];
}

@end
