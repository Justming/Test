//
//  APHomeListCell.m
//  apparel
//
//  Created by Ding on 16/7/25.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "MMYSHomeListCell.h"
#import "FitConsts.h"

@interface MMYSHomeListCell ()

@property (nonatomic,strong)UIImageView *headView;//图片
@property (nonatomic,strong)UILabel *titleLabel;//专题名称
@property (nonatomic,strong)UILabel *actLabel;//专题描述
@property (nonatomic,strong)UILabel *pliceLabel;//优惠活动

@end


@implementation MMYSHomeListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		self.backgroundColor = BG_GRAY_COLOR;
        [self addSubViews];
    }
    return self;
}

-(void)addSubViews
{
    UIView *backView				= [[UIView alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth-20, 205)];
    backView.backgroundColor		= [UIColor whiteColor];
	backView.layer.shadowColor		= BLACK_COLOR.CGColor;
	backView.layer.shadowOpacity	= 0.3;
	backView.layer.shadowRadius		= 10;
	backView.layer.shadowOffset		= CGSizeMake(3, 5);
	
    [self addSubview:backView];
	
	//单元格图片
    _headView		= [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, backView.bounds.size.width, 165)];
    _headView.image = [UIImage imageNamed:@"112"];
    [_headView setContentMode:UIViewContentModeScaleAspectFill];
    [_headView setClipsToBounds:YES];
	
	[backView addSubview:_headView];
    
	//小红点
    UILabel *botLabel			= [[UILabel alloc] initWithFrame:CGRectMake(10, 170+15-2.5, 5, 5)];
    botLabel.backgroundColor	= RED_CLOOR;
    botLabel.layer.cornerRadius	=2.5;
    [botLabel setClipsToBounds:YES];
	
    [backView addSubview:botLabel];
    
	
	_titleLabel			= [[UILabel alloc] initWithFrame:CGRectMake(18, 170, backView.bounds.size.width-106, 30)];
    _titleLabel.text	= @"GXG夏货尾货清仓【女生专场】";
    _titleLabel.font	= TEXT_FONT_LEVEL_2;
	
	[backView addSubview:_titleLabel];
	
	//优惠活动
    _pliceLabel					= [[UILabel alloc] initWithFrame:CGRectMake(backView.bounds.size.width-95, 170, 85, 30)];
    _pliceLabel.font			= TEXT_FONT_LEVEL_2;
    _pliceLabel.textColor		= [UIColor colorWithRed:240.0/255.0 green:103.0/255.0 blue:82.0/255.0 alpha:1.0];
    _pliceLabel.textAlignment	= NSTextAlignmentRight;
	
    [backView addSubview:_pliceLabel];

}

-(void)setCellValue:(MMYSHomeCellList *)list
{
    //优惠活动
    self.pliceLabel.text	= list.activity;
    //图片
    [self.headView sd_setImageWithURL:[NSURL URLWithString:list.specialPicture]];
    //专题名称
    self.titleLabel.text	= list.specialName;
}

@end
