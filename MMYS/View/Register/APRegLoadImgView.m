//
//  APRegLoadImgView.m
//  apparel
//
//  Created by JamHonyZ on 16/8/6.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APRegLoadImgView.h"
#import "FitConsts.h"

@implementation APRegLoadImgView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    _title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, kScreenWidth-20, 20)];
    _title.text = @"上传门店照片";
    _title.textColor = TEXT_COLOR_LEVEL_2;
    _title.font = TEXT_FONT_LEVEL_2;
    [self addSubview:_title];
    
     CGFloat startX=15;
    CGFloat space=10;
    CGFloat buttonW=(kScreenWidth-startX*2-space*3)/4;
    
    _bg_imageView=[[UIView alloc]initWithFrame:CGRectMake(0, 40, kScreenWidth, buttonW+space*2)];
    [_bg_imageView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:_bg_imageView];
    
   
    
    _addImage=[[UIButton alloc]initWithFrame:CGRectMake(0, space, buttonW, buttonW)];
    
    [_addImage setBackgroundImage:[UIImage imageNamed:@"addImage"] forState:UIControlStateNormal];
    [_bg_imageView addSubview:_addImage];
    
}



@end
