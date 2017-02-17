
//  MMYS
//
//  Created by yangl on 2017/1/22.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSPeronHeaderView.h"
#import "FitConsts.h"
#import "MMYSEditDataController.h"
#import "MMYSPersonController.h"
@interface MMYSPeronHeaderView ()
{
    UIImageView *editData;
	UIImageView *portrait;
	UILabel *ownerName;
	UILabel *ownerLevel;
}

@end

@implementation MMYSPeronHeaderView

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
    
    
	UIImageView *headIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 180)];
	headIV.backgroundColor = MMYS_COLOR;
    headIV.userInteractionEnabled = YES;
	[self addSubview:headIV];
	
    editData = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth-40, 15, 25, 25)];
    editData.userInteractionEnabled = YES;
    [editData setBackgroundColor:WHITE_COLOR];
    [editData addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToNextView:)]];
    editData.tag = 1000;
    [headIV addSubview:editData];
    
	portrait = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth-70)/2, 30, 70, 70)];
	portrait.backgroundColor = WHITE_COLOR;
	portrait.layer.cornerRadius = 35;
	portrait.layer.masksToBounds = YES;
	[headIV addSubview:portrait];
	
	ownerName = [[UILabel alloc] initWithFrame:CGRectMake(0, 105, kScreenWidth, 20)];
	ownerName.text = @"店主";
	ownerName.font = TEXT_FONT_LEVEL_1;
	ownerName.textColor = WHITE_COLOR;
	ownerName.textAlignment = NSTextAlignmentCenter;
	[headIV addSubview:ownerName];
	
	ownerLevel = [[UILabel alloc] initWithFrame:CGRectMake(0, 135, kScreenWidth, 20)];
	ownerLevel.text = @"钻石店主";
	ownerLevel.font = TEXT_FONT_LEVEL_2;
	ownerLevel.textColor = WHITE_COLOR;
	ownerLevel.textAlignment = NSTextAlignmentCenter;
	[headIV addSubview:ownerLevel];
	
	[self addFunctionalBtn];
}

- (void)addFunctionalBtn
{
	NSArray *images = @[@[@"mmysStore-2", @"mmysPerson-2"], @[@"mmysStore-3", @"mmysStore-8"]];
	NSArray *contents = @[@[@"待收收益\n0.00", @"累计收益\n0.00"], @[@"店员管理", @"店员提成"]];
	NSInteger k = 100;
	for (int i = 0; i < 2; i++) {
		for (int j = 0; j < 2; j++) {
			UIView *view = [[UIView alloc] initWithFrame:CGRectMake(j*kScreenWidth/2, 190+i*75, kScreenWidth/2, 75)];
			view.backgroundColor = WHITE_COLOR;
			view.layer.borderColor = LINE_COLOR.CGColor;
			view.layer.borderWidth = 0.5;
			view.tag = k;
			[self addSubview:view];
			[view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToNextView:)]];
			
			UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 25, 25, 25)];
			imageView.image = [UIImage imageNamed:images[i][j]];
			[view addSubview:imageView];
			
			UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 20, 70, 35)];
			contentLabel.text = contents[i][j];
			contentLabel.font = TEXT_FONT_LEVEL_2;
			contentLabel.textColor = TEXT_COLOR_LEVEL_2;
			contentLabel.numberOfLines = -1;
			[view addSubview:contentLabel];
            			
			k++;

		}
	}
}

- (void)tapToNextView:(UITapGestureRecognizer *)tap
{
	[self.delegate tapNextPage:tap.view.tag];
}

@end
