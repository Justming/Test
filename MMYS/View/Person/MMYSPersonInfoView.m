//
//  MMYSPersonInfoView.m
//  MMYS

//  Created by Huasheng on 2017/2/14.
//  Created by Huasheng on 2017/2/16.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSPersonInfoView.h"
#import "FitConsts.h"
@interface MMYSPersonInfoView ()


@property (nonatomic, strong) UIButton * editHeader;


@end

@implementation MMYSPersonInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createUI];
    }
    return self;
}


- (void)createUI{
    
    
    //修改头像
    UIView * topView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, 80)];
    topView.backgroundColor = [UIColor whiteColor];
    topView.userInteractionEnabled = YES;
    [self addSubview:topView];
    
    _header = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 50, 50)];
    _header.backgroundColor = [UIColor redColor];
    _header.layer.cornerRadius = 25;
    _header.layer.masksToBounds = YES;
    [topView addSubview:_header];
    
    _editHeader = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_header.bounds)+10, 25, 100, 30)];
    [_editHeader setTitle:@"修改头像" forState:UIControlStateNormal];
    _editHeader.tag = 2000;
    _editHeader.titleLabel.font = TEXT_FONT_LEVEL_1;
    [_editHeader setTitleColor:TEXT_COLOR_LEVEL_4 forState:UIControlStateNormal];
    [_editHeader addTarget:self action:@selector(changeHeader:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:_editHeader];
    
    //昵称
    UILabel * nickName = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, 70, 50)];
    nickName.text = @"昵称";
    nickName.textColor = TEXT_COLOR_LEVEL_2;
    nickName.backgroundColor = WHITE_COLOR;
    nickName.textAlignment = NSTextAlignmentCenter;
    [self addSubview:nickName];
    
    UITextField * nameTF = [[UITextField alloc] initWithFrame:CGRectMake(70, 120, kScreenWidth-70, 50)];
    nameTF.placeholder = @"萧敬腾";
    [nameTF setValue:TEXT_COLOR_LEVEL_4 forKeyPath:@"_placeholderLabel.textColor"];
    nameTF.textColor = TEXT_COLOR_LEVEL_4;
    nameTF.backgroundColor = WHITE_COLOR;
    [self addSubview:nameTF];
    
    //性别
    UILabel * sex = [[UILabel alloc] initWithFrame:CGRectMake(0, 171, 70, 50)];
    sex.text = @"性别";
    sex.textColor = TEXT_COLOR_LEVEL_2;
    sex.backgroundColor = WHITE_COLOR;
    sex.textAlignment = NSTextAlignmentCenter;
    [self addSubview:sex];
    
    UITextField * sexTF = [[UITextField alloc] initWithFrame:CGRectMake(70, 171, kScreenWidth-70, 50)];
    sexTF.placeholder = @"男or女";
    [sexTF setValue:TEXT_COLOR_LEVEL_4 forKeyPath:@"_placeholderLabel.textColor"];
    sexTF.textColor = TEXT_COLOR_LEVEL_4;
    sexTF.backgroundColor = WHITE_COLOR;
    [self addSubview:sexTF];
    
    
    //年龄
    UILabel * age = [[UILabel alloc] initWithFrame:CGRectMake(0, 222, 70, 50)];
    age.text = @"年龄";
    age.textColor = TEXT_COLOR_LEVEL_2;
    age.backgroundColor = WHITE_COLOR;
    age.textAlignment = NSTextAlignmentCenter;
    [self addSubview:age];
    
    UITextField * ageTF = [[UITextField alloc] initWithFrame:CGRectMake(70, 222, kScreenWidth-70, 50)];
    
    ageTF.backgroundColor = WHITE_COLOR;;
    [self addSubview:ageTF];
    
    
    //行业
    UILabel * industry = [[UILabel alloc] initWithFrame:CGRectMake(0, 292, 70, 50)];
    industry.text = @"行业";
    industry.textColor = TEXT_COLOR_LEVEL_2;
    industry.backgroundColor = WHITE_COLOR;;
    industry.textAlignment = NSTextAlignmentCenter;
    [self addSubview:industry];
    
    UITextField * industryTF = [[UITextField alloc] initWithFrame:CGRectMake(70, 292, kScreenWidth-70, 50)];
    industryTF.backgroundColor = WHITE_COLOR;
    [self addSubview:industryTF];
    
    //公司
    UILabel * company = [[UILabel alloc] initWithFrame:CGRectMake(0, 343, 70, 50)];
    company.text = @"公司";
    company.textColor = TEXT_COLOR_LEVEL_2;
    company.backgroundColor = WHITE_COLOR;
    company.textAlignment = NSTextAlignmentCenter;
    [self addSubview:company];
    
    UITextField * companyTF = [[UITextField alloc] initWithFrame:CGRectMake(70, 343, kScreenWidth-70, 50)];
    companyTF.backgroundColor = WHITE_COLOR;
    [self addSubview:companyTF];
    
    
    //职业
    UILabel * occupation = [[UILabel alloc] initWithFrame:CGRectMake(0, 394, 70, 50)];
    occupation.text = @"职业";
    occupation.textColor = TEXT_COLOR_LEVEL_2;
    occupation.backgroundColor = WHITE_COLOR;
    occupation.textAlignment = NSTextAlignmentCenter;
    [self addSubview:occupation];
    
    UITextField * occupationTF = [[UITextField alloc] initWithFrame:CGRectMake(70, 394, kScreenWidth-70, 50)];
    occupationTF.backgroundColor = WHITE_COLOR;
    
    [self addSubview:occupationTF];

    //个性签名
    UILabel * specialSign = [[UILabel alloc] initWithFrame:CGRectMake(0, 445, 90, 50)];
    specialSign.text = @"个性签名";
    specialSign.textColor = TEXT_COLOR_LEVEL_2;
    specialSign.backgroundColor = WHITE_COLOR;
    specialSign.textAlignment = NSTextAlignmentCenter;
    [self addSubview:specialSign];
    
    UILabel * tip = [[UILabel alloc] initWithFrame:CGRectMake(90, 445, kScreenWidth-90, 50)];
    tip.text = @"还未填写个性签名，简单介绍一下自己";
    tip.font = TEXT_FONT_LEVEL_1;
    tip.textColor = TEXT_COLOR_LEVEL_4;
    tip.backgroundColor = WHITE_COLOR;
    [self addSubview:tip];
    
    UIView * bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 495, kScreenWidth, 120)];
    bottomView.backgroundColor = WHITE_COLOR;
    [self addSubview:bottomView];
    
    UITextView * signTV = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth-20, 100)];
    signTV.backgroundColor = LINE_COLOR_MASK;
    [bottomView addSubview:signTV];
    
    
}

- (void)changeHeader:(UIButton *)button{
    
    //NSLog(@"修改头像");
    // [self.delegate changeHeaderImage:button.tag];

}

@end
