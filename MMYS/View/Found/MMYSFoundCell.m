//
//  MMYSFoundCell.m
//  MMYS
//
//  Created by yangl on 2017/2/14.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSFoundCell.h"
#import "FitConsts.h"

@interface MMYSFoundCell ()
{
	UIImageView *headIV;
	UILabel *title;
	UILabel *time;
	UILabel *goodName;
	UILabel *goodDesc;
}

@end

@implementation MMYSFoundCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	
	if (self) {
		[self initLayout];
	}
	return self;
}

- (void)initLayout
{
//	self.backgroundColor = BG_GRAY_COLOR;
	
	UIView *whiteBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 25)];
	whiteBg.backgroundColor = WHITE_COLOR;
	[self addSubview:whiteBg];
	
	headIV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 35, 35)];
	headIV.backgroundColor = BG_GRAY_COLOR;
	headIV.layer.cornerRadius = 35/2.0;
	headIV.layer.masksToBounds = YES;
	[whiteBg addSubview:headIV];
	
	title = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 200, 20)];
	title.text = @"元旦送豪礼";
	title.font = TEXT_FONT_LEVEL_2;
	title.textColor = TEXT_COLOR_LEVEL_2;
	[whiteBg addSubview:title];
	
	time = [[UILabel alloc] initWithFrame:CGRectMake(60, 30, 200, 15)];
	time.text = @"2017.01.01";
	time.font = TEXT_FONT_LEVEL_3;
	time.textColor = TEXT_COLOR_LEVEL_3;
	[whiteBg addSubview:time];
	
	UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 55, kScreenWidth, 0.5)];
	line.backgroundColor = BG_GRAY_COLOR;
	[whiteBg addSubview:line];
	
	goodName = [[UILabel alloc] initWithFrame:CGRectMake(10, 65, 200, 20)];
	goodName.text = @"商品名称";
	goodName.font = TEXT_FONT_LEVEL_2;
	goodName.textColor = TEXT_COLOR_LEVEL_2;
	[whiteBg addSubview:goodName];
	
	goodDesc = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, kScreenWidth-20, 30)];
	goodDesc.text = @"现年42岁的艾萨米今年1月4日刚被任命为委内瑞拉副总统，此前他曾任委内瑞拉阿拉瓜州州长";
	goodDesc.font = TEXT_FONT_LEVEL_2;
	goodDesc.textColor = TEXT_COLOR_LEVEL_3;
	[whiteBg addSubview:goodDesc];
	
	CGFloat imageLength = (kScreenWidth-40)/3;
	for (int i=0; i<3; i++) {
		UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10+i*(imageLength+10), 130, imageLength, imageLength)];
		imageView.backgroundColor = BG_GRAY_COLOR;
		[self addSubview:imageView];
	}
}

@end
