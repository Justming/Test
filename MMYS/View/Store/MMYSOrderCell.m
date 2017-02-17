//
//  MMYSOrderCell.m
//  MMYS
//
//  Created by yangl on 2017/2/9.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSOrderCell.h"
#import "FitConsts.h"

@interface MMYSOrderCell ()
{
	UILabel *orderNum;		//订单号
	UILabel *orderState;	//订单状态
	UIImageView *thumbnail;	//商品缩略图
	UILabel *goodDesc;		//商品描述
	UILabel *time;			//下单时间
	UILabel *unitPrice;		//商品单价
	UILabel *amount;		//下单数量
	UILabel *total;			//总计
}

@end

@implementation MMYSOrderCell

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
	self.backgroundColor = BG_GRAY_COLOR;
	UIView *whiteBg = [[UIView alloc] initWithFrame:CGRectMake(0, 15, kScreenWidth, 145)];
	whiteBg.backgroundColor = WHITE_COLOR;
	[self addSubview:whiteBg];
	
	orderNum = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 30)];
	orderNum.text = @"订单号：1627362784736273";
	orderNum.font = TEXT_FONT_LEVEL_3;
	orderNum.textColor = TEXT_COLOR_LEVEL_2;
	[whiteBg addSubview:orderNum];
	
	orderState = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-10-50, 0, 50, 30)];
	orderState.text = @"待付款";
	orderState.textColor = MMYS_COLOR;
	orderState.font = TEXT_FONT_LEVEL_3;
	orderState.textAlignment = NSTextAlignmentRight;
	[whiteBg addSubview:orderState];
	
	UILabel *line1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 29, kScreenWidth, 0.5)];
	line1.backgroundColor = BG_GRAY_COLOR;
	[whiteBg addSubview:line1];
	
	thumbnail = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40, 50, 50)];
	thumbnail.backgroundColor = BG_GRAY_COLOR;
	[whiteBg addSubview:thumbnail];
	
	goodDesc = [[UILabel alloc] initWithFrame:CGRectMake(70, 40, kScreenWidth-140, 30)];
	goodDesc.text = @"作品围绕主人公蛮吉等人，讲述了在架空的世界——元泱界中，天地两界共同合力对抗每隔333年诞生的可怕异常生命——魁拔的故事。";
	goodDesc.font = TEXT_FONT_LEVEL_3;
	goodDesc.textColor = TEXT_COLOR_LEVEL_2;
	goodDesc.numberOfLines = -1;
	[whiteBg addSubview:goodDesc];
	
	time = [[UILabel alloc] initWithFrame:CGRectMake(70, 80, 100, 15)];
	time.text = @"2016-01-01";
	time.font = TEXT_FONT_LEVEL_3;
	time.textColor = TEXT_COLOR_LEVEL_3;
	[whiteBg addSubview:time];
	
	unitPrice = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-10-70, 50, 70, 20)];
	unitPrice.text = @"￥174.80";
	unitPrice.font = TEXT_FONT_LEVEL_2;
	unitPrice.textColor = TEXT_COLOR_LEVEL_2;
	unitPrice.textAlignment = NSTextAlignmentRight;
	[whiteBg addSubview:unitPrice];
	
	amount = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-10-40, 80, 40, 15)];
	amount.text = @"x2";
	amount.font = TEXT_FONT_LEVEL_3;
	amount.textColor = TEXT_COLOR_LEVEL_3;
	[whiteBg addSubview:amount];
	
	UILabel *line2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 99, kScreenWidth, 0.5)];
	line2.backgroundColor = BG_GRAY_COLOR;
	[whiteBg addSubview:line2];
	
	
	total = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth-10, 45)];
	total.text = @"共2件商品    合计： ￥100";
	total.font = TEXT_FONT_LEVEL_2;
	total.textColor = TEXT_COLOR_LEVEL_2;
	total.textAlignment = NSTextAlignmentRight;
	[whiteBg addSubview:total];
}

@end
