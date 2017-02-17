//
//  MMYSEmployeeCell.m
//  MMYS
//
//  Created by yangl on 2017/2/13.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSEmployeeCell.h"
#import "FitConsts.h"

@interface MMYSEmployeeCell ()
{
	UILabel *name;
	UILabel *phone;
}

@end

@implementation MMYSEmployeeCell

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
	name.textColor = TEXT_COLOR_LEVEL_1;
	[self addSubview:name];
	
	phone = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 200, 20)];
	phone.text = @"18205186136";
	phone.font = TEXT_FONT_LEVEL_2;
	phone.textColor = TEXT_COLOR_LEVEL_3;
	[self addSubview:phone];
	
	UIImageView *close = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth-30, 20, 20, 20)];
	close.image = [UIImage imageNamed:@"mmysClose"];
	close.userInteractionEnabled = YES;
	[self addSubview:close];
}

@end
