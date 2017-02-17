//
//  MMYSUncollectedCell.m
//  MMYS
//
//  Created by yangl on 2017/2/13.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSUncollectedCell.h"
#import "FitConsts.h"

@implementation MMYSUncollectedCell

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
	self.backgroundColor = WHITE_COLOR;
	
	_textL = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 70, 15)];
	_textL.text = @"待收金额";
	_textL.font = TEXT_FONT_LEVEL_2;
	_textL.textColor = TEXT_COLOR_LEVEL_2;
	[self addSubview:_textL];
	
	_textField = [[UITextField alloc] initWithFrame:CGRectMake(90, 15, 200, 15)];
	_textField.placeholder = @"输入提现金额";
	_textField.font = TEXT_FONT_LEVEL_2;
	_textField.textColor = TEXT_COLOR_LEVEL_2;
	[self addSubview:_textField];
}

@end
