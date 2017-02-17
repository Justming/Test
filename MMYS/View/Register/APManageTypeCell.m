//
//  APManageTypeCell.m
//  apparel
//
//  Created by JamHonyZ on 16/8/31.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APManageTypeCell.h"
#import "FitConsts.h"

@implementation APManageTypeCell
{
    UIView *bgView;
}
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
    bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    [bgView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:bgView];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, self.frame.size.width, 20)];
    [label setText:@"经营品类"];
    [label setFont:TEXT_FONT_LEVEL_2];
    [bgView  addSubview:label];
    
    CGFloat zoneWidth=kScreenWidth/3;
    
    //男装
    _manButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 50, zoneWidth, 30)];
    [_manButton addTarget:self action:@selector(buttonManClick:) forControlEvents:UIControlEventTouchUpInside];
    [_manButton setSelected:NO];
    [bgView addSubview:_manButton];
    
    UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(zoneWidth/2-5, 7, -16, 16)];
    [img setImage:[UIImage imageNamed:@"authentication"]];
    [_manButton addSubview:img];
    
    _manCloth=[[UILabel alloc]initWithFrame:CGRectMake(zoneWidth/2+5, 50, zoneWidth/2+5, 30)];
    [_manCloth setText:@"男装"];
    [_manCloth setTextColor:[UIColor grayColor]];
    [_manCloth setFont:TEXT_FONT_LEVEL_2];
    [bgView addSubview:_manCloth];
    
    //女装
    _womanButton=[[UIButton alloc]initWithFrame:CGRectMake(zoneWidth, 50, zoneWidth, 30)];
    [_womanButton addTarget:self action:@selector(buttonWomanClick:) forControlEvents:UIControlEventTouchUpInside];
    [_womanButton setSelected:NO];
    [bgView addSubview:_womanButton];
    
    UIImageView *img1=[[UIImageView alloc]initWithFrame:CGRectMake(zoneWidth/2-5, 7, -16, 16)];
    [img1 setImage:[UIImage imageNamed:@"authentication"]];
    [_womanButton addSubview:img1];
    
    _womanCloth=[[UILabel alloc]initWithFrame:CGRectMake(zoneWidth+zoneWidth/2+5, 50, zoneWidth/2+5, 30)];
    [_womanCloth setText:@"女装"];
    [_womanCloth setTextColor:[UIColor grayColor]];
    [_womanCloth setFont:TEXT_FONT_LEVEL_2];
    [bgView addSubview:_womanCloth];
    
    //童装
    _childButton=[[UIButton alloc]initWithFrame:CGRectMake(zoneWidth*2, 50, zoneWidth, 30)];
    [_childButton addTarget:self action:@selector(buttonChildClick:) forControlEvents:UIControlEventTouchUpInside];
    [_childButton setSelected:NO];
    [bgView addSubview:_childButton];
    
    UIImageView *img2=[[UIImageView alloc]initWithFrame:CGRectMake(zoneWidth/2-5, 7, -16, 16)];
    [img2 setImage:[UIImage imageNamed:@"authentication"]];
    [_childButton addSubview:img2];
    
    _childCloth=[[UILabel alloc]initWithFrame:CGRectMake(zoneWidth*2+zoneWidth/2+5, 50, zoneWidth/2+5, 30)];
    [_childCloth setText:@"童装"];
    [_childCloth setTextColor:[UIColor grayColor]];
    [_childCloth setFont:TEXT_FONT_LEVEL_2];
    [bgView addSubview:_childCloth];
    
    _typeAddView = [[UITextField alloc] initWithFrame:CGRectMake(10, 90, kScreenWidth-20, 30)];
    _typeAddView.placeholder=@"其他类型补充";
    _typeAddView.font = TEXT_FONT_LEVEL_2;
    
    [_typeAddView setKeyboardType:UIKeyboardTypeDefault];
    _typeAddView.keyboardType=UIKeyboardTypeDefault;
    [_typeAddView setReturnKeyType:UIReturnKeyDone];
    [_typeAddView setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [bgView addSubview:_typeAddView];
    
    UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(10, 121, kScreenWidth-20, 1)];
    [line setBackgroundColor:LINE_COLOR];
    [bgView addSubview:line];
}

#pragma mark 按钮点击方法

-(void)buttonManClick:(UIButton *)sender
{
    sender.selected=!sender.selected;
    //男装
    for (UIImageView *image in _manButton.subviews) {
        if (_manButton.selected) {
            [image setImage:[UIImage imageNamed:@"redDuiHao"]];
            [_manCloth setTextColor:[UIColor blackColor]];
        }else{
            [image setImage:[UIImage imageNamed:@"authentication"]];
            [_manCloth setTextColor:[UIColor grayColor]];
        }
    }
    [self calcuteSelectManageType];
}

-(void)buttonWomanClick:(UIButton *)sender
{
    sender.selected=!sender.selected;
    //女装
    for (UIImageView *image in _womanButton.subviews) {
        if (_womanButton.selected) {
            [image setImage:[UIImage imageNamed:@"redDuiHao"]];
            [_womanCloth setTextColor:[UIColor blackColor]];
        }else{
            [image setImage:[UIImage imageNamed:@"authentication"]];
            [_womanCloth setTextColor:[UIColor grayColor]];
        }
    }
    [self calcuteSelectManageType];
}


-(void)buttonChildClick:(UIButton *)sender
{
    sender.selected=!sender.selected;
       //童装
    for (UIImageView *image in _childButton.subviews) {
        if (_childButton.selected) {
            [image setImage:[UIImage imageNamed:@"redDuiHao"]];
            [_childCloth setTextColor:[UIColor blackColor]];
        }else{
            [image setImage:[UIImage imageNamed:@"authentication"]];
            [_childCloth setTextColor:[UIColor grayColor]];
        }
    }
    [self calcuteSelectManageType];
}

#pragma mark 计算选择的经营品类

-(void)calcuteSelectManageType
{
   NSMutableArray * _manageTypeArray=[NSMutableArray arrayWithCapacity:0];
    if (_manButton.selected) {
        [_manageTypeArray addObject:@"男装"];
    }
    if (_womanButton.selected) {
        [_manageTypeArray addObject:@"女装"];
    }
    if (_childButton.selected) {
        [_manageTypeArray addObject:@"童装"];
    }
    self.Block(_manageTypeArray);
}

@end
