//
//  MMYSDeductCell.m
//  MMYS
//
//  Created by yangl on 2017/2/13.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSDeductCell.h"
#import "FitConsts.h"

@interface MMYSDeductCell ()
{
	UILabel *name;
	UILabel *phone;
	UILabel *deduct;
}
@end

@implementation MMYSDeductCell

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
	
	name = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
	name.text = @"店员";
	name.font = TEXT_FONT_LEVEL_1;
	name.textColor = TEXT_COLOR_LEVEL_2;
	[self addSubview:name];
	
	phone = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 200, 20)];
	phone.text = @"18205186136";
	phone.font = TEXT_FONT_LEVEL_2;
	phone.textColor = TEXT_COLOR_LEVEL_3;
	[self addSubview:phone];
	
	deduct = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-150, 20, 60, 20)];
	deduct.text = @"￥1250";
	deduct.font = TEXT_FONT_LEVEL_2;
	deduct.textColor = MMYS_COLOR;
	[self addSubview:deduct];
	
	UILabel *payDeduct = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-80, 15, 70, 30)];
	payDeduct.text = @"发放提成";
	payDeduct.font = TEXT_FONT_LEVEL_3;
	payDeduct.textColor = WHITE_COLOR;
	payDeduct.backgroundColor = MMYS_COLOR;
	payDeduct.layer.cornerRadius = 3;
	payDeduct.layer.masksToBounds = YES;
	payDeduct.textAlignment = NSTextAlignmentCenter;
	payDeduct.userInteractionEnabled = YES;
	[payDeduct addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(provideDeduct)]];
	[self addSubview:payDeduct];
}

- (void)provideDeduct
{
	NSLog(@"hello");
}

@end
