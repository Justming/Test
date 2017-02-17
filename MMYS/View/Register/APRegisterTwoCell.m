//
//  APRegisterTwoCell.m
//  apparel
//
//  Created by JamHonyZ on 16/8/6.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APRegisterTwoCell.h"
#import "FitConsts.h"

@implementation APRegisterTwoCell

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

    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, kScreenWidth-20, 20)];
    title.text = @"上传身份证照片";
    title.textColor = TEXT_COLOR_LEVEL_2;
    title.font = TEXT_FONT_LEVEL_2;
    [self addSubview:title];
    
    
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(80, 40, kScreenWidth-160, (kScreenWidth-160)*2/3)];
    [view setBackgroundColor:[UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1.0]];
    [self addSubview:view];
    
    
    UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(view.frame.size.width/3, view.frame.size.height/4, view.frame.size.width/3,view.frame.size.height/2)];
    [image setImage:[UIImage imageNamed:@"cardimage"]];
    [image setContentMode:UIViewContentModeScaleAspectFill];
    [image setClipsToBounds:YES];
    [view addSubview:image];
    
    _cardImg=[[UIImageView alloc]initWithFrame:CGRectMake(80, 40, kScreenWidth-160, (kScreenWidth-160)*2/3)];
    [_cardImg setContentMode:UIViewContentModeScaleAspectFill];
    [_cardImg setClipsToBounds:YES];
    [self addSubview:_cardImg];
    
    
    _cardImage = [[UIButton alloc] initWithFrame:CGRectMake(80, 40, kScreenWidth-160, (kScreenWidth-160)*2/3)];
    [self addSubview:_cardImage];
    
    
    
    
}
@end
