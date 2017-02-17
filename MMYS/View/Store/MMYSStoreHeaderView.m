//
//  MMYSStoreHeaderView.m
//  MMYS
//
//  Created by yangl on 2017/1/21.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSStoreHeaderView.h"
#import "FitConsts.h"
#import "UIImageView+AFNetworking.h"
@interface MMYSStoreHeaderView ()
{
	UILabel *ownerName;
	UILabel *storeID;
	UILabel *storeName;
	UIImageView *portrait;
	
	UILabel *totalOrder;
}

@end

@implementation MMYSStoreHeaderView

-(instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self createUI];
	}
	return self;
}

- (void)createUI
{	
	UIView *top = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 225)];
	top.backgroundColor = WHITE_COLOR;
	[self addSubview:top];
	[self addSubviewsToTop:top];
	
	UIView *mid = [[UIView alloc] initWithFrame:CGRectMake(0, 235, kScreenWidth, 120)];
	mid.backgroundColor = WHITE_COLOR;
	[self addSubview:mid];
	[self addSubviewsToMid:mid];
	
	UIView *bot = [[UIView alloc] initWithFrame:CGRectMake(0, 365, kScreenWidth, 80)];
	bot.backgroundColor = WHITE_COLOR;
	[self addSubview:bot];
	[self addSubviewsToBot:bot];
}

- (void)addSubviewsToTop:(UIView *)topView
{
	UIImageView *bgIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 140)];
	bgIV.backgroundColor = MMYS_COLOR;
	[topView addSubview:bgIV];
	
	portrait = [[UIImageView alloc] initWithFrame:CGRectMake(10, 35, 70, 70)];
	portrait.backgroundColor = WHITE_COLOR;
	portrait.layer.cornerRadius = 35;
	portrait.layer.masksToBounds = YES;
	[bgIV addSubview:portrait];
	
	ownerName = [[UILabel alloc] initWithFrame:CGRectMake(90, 35, 150, 20)];
	ownerName.text = @"店主";
	ownerName.font = TEXT_FONT_LEVEL_1;
	ownerName.textColor = WHITE_COLOR;
	[bgIV addSubview:ownerName];
	
	storeID = [[UILabel alloc] initWithFrame:CGRectMake(90, 70, 150, 15)];
	storeID.text = @"店铺ID：0001";
	storeID.font = TEXT_FONT_LEVEL_2;
	storeID.textColor = WHITE_COLOR;
	[bgIV addSubview:storeID];
	
	storeName = [[UILabel alloc] initWithFrame:CGRectMake(90, 90, 150, 15)];
	storeName.text = @"店主的店";
	storeName.font = TEXT_FONT_LEVEL_2;
	storeName.textColor = WHITE_COLOR;
	[bgIV addSubview:storeName];
	
	NSArray *images = @[@"mmysStore-1", @"mmysStore-2", @"mmysStore-3"];
	NSArray *texts = @[@"销售量", @"销售金额", @"客户流量"];
	CGFloat inset = (kScreenWidth - 23*3)/6.0;

	for (int i = 0; i < 3; i++) {
		UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(inset+i*(inset*2 + 23), 150, 23, 23)];
		imageView.image = [UIImage imageNamed:images[i]];
		[topView addSubview:imageView];
		
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i*kScreenWidth/3, 180, kScreenWidth/3, 15)];
		label.text = texts[i];
		label.font = TEXT_FONT_LEVEL_3;
		label.textColor = TEXT_COLOR_LEVEL_2;
		label.textAlignment = NSTextAlignmentCenter;
		[topView addSubview:label];
		
		UILabel *labelA = [[UILabel alloc] initWithFrame:CGRectMake(i*kScreenWidth/3, 200, kScreenWidth/3, 20)];
        labelA.tag = 10 + i;
		labelA.text = @"123";
		labelA.font = kFont(16);
		labelA.textColor = MMYS_COLOR;
		labelA.textAlignment = NSTextAlignmentCenter;
		[topView addSubview:labelA];
	}

}

- (void)addSubviewsToMid:(UIView *)midView
{
	UILabel *customerL = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 40)];
	customerL.text = @"客户订单";
	customerL.textColor = TEXT_COLOR_LEVEL_2;
	customerL.font = TEXT_FONT_LEVEL_2;
	[midView addSubview:customerL];
	
	UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, kScreenWidth, 0.5)];
	line.backgroundColor = LINE_COLOR;
	[midView addSubview:line];
	
	totalOrder = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-70, 0, 70, 40)];
	totalOrder.text = @"全部订单  >";
	totalOrder.font = TEXT_FONT_LEVEL_3;
	totalOrder.textColor = TEXT_COLOR_LEVEL_3;
	totalOrder.userInteractionEnabled = YES;
	totalOrder.tag = 100;
	[totalOrder addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoNextView:)]];
	[midView addSubview:totalOrder];
	
	NSArray *images = @[@"mmysStore-4", @"mmysStore-5", @"mmysStore-6"];
	NSArray *texts = @[@"待付款", @"待发货", @"交易成功"];
	CGFloat inset = (kScreenWidth - 23*3)/6.0;
	for (int i=0; i<3; i++) {
		//图标
		UIImageView *imageView = [[UIImageView alloc] init];
		if (i == 1) {
			imageView.frame = CGRectMake(inset+i*(inset*2+23)-3, 58, 30, 23);
		} else {
			imageView.frame = CGRectMake(inset+i*(inset*2+23)-2, 58, 27, 23);
		}
		imageView.image = [UIImage imageNamed:images[i]];
		[midView addSubview:imageView];
		//静态文字
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i*kScreenWidth/3, 90, kScreenWidth/3, 15)];
		label.text = texts[i];
		label.font = TEXT_FONT_LEVEL_3;
		label.textColor = TEXT_COLOR_LEVEL_2;
		label.textAlignment = NSTextAlignmentCenter;
		[midView addSubview:label];
		//点击区域
		UIView *view = [[UIView alloc] initWithFrame:CGRectMake(inset+i*(inset*2+23)-10, 58, 45, 45)];
		[midView addSubview:view];
		view.tag = 101+i;
		[view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoNextView:)]];
	}
}

- (void)addSubviewsToBot:(UIView *)botView
{
	NSArray *images = @[@"mmysStore-7", @"mmysStore-8", @"mmysStore-9"];
	NSArray *texts = @[@"商品管理", @"客户管理", @"店铺信息"];
	CGFloat inset = (kScreenWidth - 25*3)/6.0;
	for (int i=0; i<3; i++) {
		//图标
		UIImageView *imageView = [[UIImageView alloc] init];
		if (i == 1) {
			imageView.frame = CGRectMake(inset+i*(inset*2+25), 18, 25, 25);
		} else {
			imageView.frame = CGRectMake(inset+i*(inset*2+25), 18, 25, 25);
		}
		imageView.image = [UIImage imageNamed:images[i]];
		[botView addSubview:imageView];
		//静态文字
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(i*kScreenWidth/3, 50, kScreenWidth/3, 15)];
		label.text = texts[i];
		label.font = TEXT_FONT_LEVEL_3;
		label.textColor = TEXT_COLOR_LEVEL_2;
		label.textAlignment = NSTextAlignmentCenter;
		[botView addSubview:label];
		//点击区域
		UIView *view = [[UIView alloc] initWithFrame:CGRectMake(inset+i*(inset*2+23)-10, 18, 45, 45)];
		[botView addSubview:view];
		view.tag = 104+i;
		[view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoNextView:)]];
	}
}

- (void)gotoNextView:(UITapGestureRecognizer *)tap
{
	[self.delegate gotoNextPage:tap.view.tag];
}

- (void)addStoreInfoWithData:(NSDictionary *)storeInfo{
    
    NSString *owner_name = [storeInfo objectForKey:@"owner_name"];;
    if (![owner_name isEqualToString:@""] && owner_name != nil) {
        ownerName.text = owner_name;
    }
    
    NSString *store_name = [storeInfo objectForKey:@"name"];
    if (![store_name isEqualToString:@""] && store_name != nil) {
        storeName.text = store_name;
    }
    
    
    NSString * imageUrl = [storeInfo objectForKey:@"image"];
    if ([imageUrl isKindOfClass:[NSString class]])
    {
        [portrait setImageWithURL:[NSURL URLWithString:imageUrl]];
    }
    
    
    UILabel *sales_volume = [self viewWithTag:10];
    NSString *total_sales_volume = [NSString stringWithFormat:@"%@", [storeInfo objectForKey:@"total_sales_volume"]];
    if (![total_sales_volume isEqualToString:@""] && ![total_sales_volume isEqualToString:@"(null)"]) {
        NSLog(@"%@", total_sales_volume);
        sales_volume.text = total_sales_volume;
    }
    
    
    UILabel *sales_amount = [self viewWithTag:11];
    NSString *total_sales_amount = [NSString stringWithFormat:@"%@", [storeInfo objectForKey:@"total_sales_amount"]];
    if (![total_sales_amount isEqualToString:@""] && ![total_sales_volume isEqualToString:@"(null)"]) {
        sales_amount.text = total_sales_amount;
    }
    
    UILabel *client_num   = [self viewWithTag:12];
    NSString *total_client_num = [NSString stringWithFormat:@"%@", [storeInfo objectForKey:@"total_client_num"]];
    if (![total_client_num isEqualToString:@""] && ![total_sales_volume isEqualToString:@"(null)"]) {
        client_num.text = total_client_num;
    }
    
    
}

@end
