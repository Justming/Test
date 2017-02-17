//
//  APHomeDetailController.m
//  apparel
//
//  Created by Ding on 16/7/26.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "MMYSHomeDetailController.h"
#import "FitConsts.h"
#import "MMYSGoodsDetailView.h"

@interface MMYSHomeDetailController ()

@end


@implementation MMYSHomeDetailController

- (void)viewDidLoad {
	
    [super viewDidLoad];
	[self createUI];
}

- (void)createUI
{
	self.view.backgroundColor = BG_GRAY_COLOR;
	
	MMYSGoodsDetailView *goodsDetailView = [[MMYSGoodsDetailView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kTopBarHeight)];
	[self.view addSubview:goodsDetailView];
}

@end
