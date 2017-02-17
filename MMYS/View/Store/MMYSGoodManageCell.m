//
//  MMYSGoodManageCell.m
//  MMYS
//
//  Created by yangl on 2017/2/8.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSGoodManageCell.h"
#import "FitConsts.h"

@interface MMYSGoodManageCell ()
{
	UIImageView *goodIV;
	UILabel *goodTitle;
	UILabel *goodSellNum;
	UILabel *time;
	UIButton *soldoutBtn;
}
@end

@implementation MMYSGoodManageCell

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	
	if (self) {
		[self initLayout];
	}
	return self;
}

- (void)initLayout
{
	self.backgroundColor		= [UIColor whiteColor];
	self.layer.shadowColor		= BLACK_COLOR.CGColor;
	self.layer.shadowOpacity	= 0.3;
	self.layer.shadowRadius		= 2;
	self.layer.shadowOffset		= CGSizeMake(0, 1);
	
	goodIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 165)];
	goodIV.backgroundColor = BG_GRAY_COLOR;
	[self addSubview:goodIV];
	
	goodTitle = [[UILabel alloc] initWithFrame:CGRectMake(5, 170, self.bounds.size.width, 15)];
	goodTitle.text = @"商品名称";
	goodTitle.font = TEXT_FONT_LEVEL_2;
	goodTitle.textColor = TEXT_COLOR_LEVEL_2;
	[self addSubview:goodTitle];
	
	goodSellNum = [[UILabel alloc] initWithFrame:CGRectMake(5, 190, self.bounds.size.width, 15)];
	goodSellNum.text = @"热销量： 100";
	goodSellNum.font = TEXT_FONT_LEVEL_3;
	goodSellNum.textColor = TEXT_COLOR_LEVEL_3;
	[self addSubview:goodSellNum];
	
	time = [[UILabel alloc] initWithFrame:CGRectMake(5, 210, self.bounds.size.width, 15)];
	time.text = @"2016.1.1";
	time.font = TEXT_FONT_LEVEL_3;
	time.textColor = TEXT_COLOR_LEVEL_3;
	[self addSubview:time];
	
	soldoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	soldoutBtn.frame = CGRectMake(self.bounds.size.width-55, 205, 50, 20);
	soldoutBtn.backgroundColor = MMYS_COLOR;
	soldoutBtn.titleLabel.font = TEXT_FONT_LEVEL_2;
	[soldoutBtn setTitle:@"下架" forState:UIControlStateNormal];
	[self addSubview:soldoutBtn];
}

@end
