//
//  APRegisterFourCell.m
//  apparel
//
//  Created by JamHonyZ on 16/8/6.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APRegisterFourCell.h"
#import "FitConsts.h"

@implementation APRegisterFourCell

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
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, kScreenWidth-20, 20)];
    title.text = @"上传营业执照";
    title.textColor = TEXT_COLOR_LEVEL_2;
    title.font = TEXT_FONT_LEVEL_2;
    [self addSubview:title];
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(80, 40, kScreenWidth-160, (kScreenWidth-160)*2/3)];
    [view setBackgroundColor:[UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1.0]];
    [self addSubview:view];
    
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(view.frame.size.width/4, view.frame.size.height/4, view.frame.size.width/2,view.frame.size.height/2)];
    [image setImage:[UIImage imageNamed:@"licence"]];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    [image setClipsToBounds:YES];
    [view addSubview:image];
    
    _licenceImg=[[UIImageView alloc]initWithFrame:CGRectMake(80, 40, kScreenWidth-160, self.frame.size.height-50)];
    [_licenceImg setContentMode:UIViewContentModeScaleAspectFill];
    [_licenceImg setClipsToBounds:YES];
    [self addSubview:_licenceImg];
    
    _licenceImage = [[UIButton alloc] initWithFrame:CGRectMake(80, 40, kScreenWidth-160, self.frame.size.height-50)];
    [self addSubview:_licenceImage];
    
}

@end
