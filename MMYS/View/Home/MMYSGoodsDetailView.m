//
//  MMYSGoodsDetailView.m
//  MMYS
//
//  Created by yangl on 2017/1/20.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSGoodsDetailView.h"
#import "FitConsts.h"

@interface MMYSGoodsDetailView ()
//top
@property(nonatomic, strong) UIImageView *imageView;
@property(nonatomic, strong) UILabel *goodName;
@property(nonatomic, strong) UILabel *goodDesc;
@property(nonatomic, strong) UILabel *price;
//mid

@end


@implementation MMYSGoodsDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self createUI];
	}
	return self;
}
	
- (void)createUI
{
	self.backgroundColor = BG_GRAY_COLOR;
	self.contentSize = CGSizeMake(kScreenWidth, 950);
	
	UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 355)];
	topView.backgroundColor = WHITE_COLOR;
	[self addSubview:topView];
	
	UIView *midView = [[UIView alloc] initWithFrame:CGRectMake(0, 370, kScreenWidth, 330)];
	midView.backgroundColor = WHITE_COLOR;
	[self addSubview:midView];
	
	UIView *botView = [[UIView alloc] initWithFrame:CGRectMake(0, 715, kScreenWidth, 235)];
	botView.backgroundColor = WHITE_COLOR;
	[self addSubview:botView];
	
	[self addSubviewToTop:topView];
	[self addsubviewsToMid:midView];
	[self addsubviewsToBot:botView];
}

- (void)addSubviewToTop:(UIView *)top
{
	_imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 230)];
	_imageView.backgroundColor = ORANGE_COLOR;
	[top addSubview:_imageView];
	
	_goodName = [[UILabel alloc] initWithFrame:CGRectMake(10, 245, 200, 20)];
	_goodName.text = @"商品名称";
	_goodName.font = TEXT_FONT_LEVEL_2;
	_goodName.textColor = TEXT_COLOR_LEVEL_2;
	[top addSubview:_goodName];
	
	_goodDesc = [[UILabel alloc] initWithFrame:CGRectMake(10, 270, kScreenWidth-20, 40)];
	_goodDesc.text = @"商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍商品介绍";
	_goodDesc.font = TEXT_FONT_LEVEL_2;
	_goodDesc.textColor = TEXT_COLOR_LEVEL_3;
	_goodDesc.numberOfLines = -1;
	[top addSubview:_goodDesc];
	
	_price = [[UILabel alloc] initWithFrame:CGRectMake(10, 320, 100, 20)];
	_price.text = @"￥396";
	_price.font = kFont(20);
	_price.textColor = RED_COLOR;
	[top addSubview:_price];
	
}

- (void)addsubviewsToMid:(UIView *)mid
{
	NSArray *titles = @[@"品        牌", @"规        格", @"产        地", @"存储方法", @"保  质  期", @"适用人群", @"快递信息", @"服务信息", @"温馨提示"] ;
	NSArray *contents = @[@"馋猫少女", @"衣服漂亮", @"浙江", @"直接出", @"终身报纸", @"衣服漂亮", @"衣服漂亮", @"衣服漂亮", @"衣服漂亮"];
	
	UILabel *goodDetail = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 100, 20)];
	goodDetail.text = @"商品详情";
	goodDetail.font = TEXT_FONT_LEVEL_1;
	goodDetail.textColor = TEXT_COLOR_LEVEL_2;
	[mid addSubview:goodDetail];
	
	for (int i = 0; i < 9; i++) {
		UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(5, 50+30*i, 90, 15)];
		title.text = [NSString stringWithFormat:@"【%@】" ,titles[i]];
		title.font = TEXT_FONT_LEVEL_2;
		title.textColor = TEXT_COLOR_LEVEL_2;
		[mid addSubview:title];
		
		UILabel *content = [[UILabel alloc] initWithFrame:CGRectMake(110, 50+30*i, kScreenWidth-110, 15)];
		content.text = contents[i];
		content.font = TEXT_FONT_LEVEL_2;
		content.textColor = TEXT_COLOR_LEVEL_3;
		[mid addSubview:content];
	}
}

- (void)addsubviewsToBot:(UIView *)bot
{
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 180)];
	imageView.backgroundColor = ORANGE_COLOR;
	[bot addSubview:imageView];
	
	UILabel *left = [[UILabel alloc] initWithFrame:CGRectMake(0, 180, kScreenWidth/2, bot.bounds.size.height-180)];
	left.text = @"价格：￥396";
	left.font = kFont(18);
	left.textAlignment = NSTextAlignmentCenter;
	[bot addSubview:left];
	
	UILabel *right = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth/2, 180, kScreenWidth/2, bot.bounds.size.height-180)];
	right.backgroundColor = MMYS_COLOR;
	right.text = @"商品上架";
	right.font = kFont(18);
	right.textColor = WHITE_COLOR;
	right.userInteractionEnabled = YES;
	right.textAlignment = NSTextAlignmentCenter;
	[bot addSubview:right];
}

@end
