//
//  FirContactsController.m
//  firefly
//
//  Created by Ding on 16/6/16.
//  Copyright © 2016年 Huasheng. All rights reserved.
//


#import "MMYSOrderController.h"
#import "SegmentViewController.h"
#import "MMYSOrderDetailController.h"
#import "FitConsts.h"

static CGFloat const ButtonHeight = 50;

@interface MMYSOrderController ()

@end

@implementation MMYSOrderController

- (instancetype)initWithIndex:(NSInteger)index
{
	self = [super init];
	if (self) {
		[self createUIWithIndex:index];
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)createUIWithIndex:(NSInteger)index
{
	self.view.backgroundColor = [UIColor whiteColor];
	self.title = @"订单";
	
	SegmentViewController *vc = [[SegmentViewController alloc]init];
	NSArray *titleArray = @[@"全部", @"待付款", @"待发货", @"已完成"];
	
	vc.titleArray = titleArray;
	NSMutableArray *controlArray = [[NSMutableArray alloc]init];
	
	MMYSOrderDetailController *vc1 = [[MMYSOrderDetailController alloc]init];
	[controlArray addObject:vc1];
	
	MMYSOrderDetailController *vc2 = [[MMYSOrderDetailController alloc]init];
	[controlArray addObject:vc2];
	
	MMYSOrderDetailController *vc3 = [[MMYSOrderDetailController alloc]init];
	[controlArray addObject:vc3];
	
	MMYSOrderDetailController *vc4 = [[MMYSOrderDetailController alloc]init];
	[controlArray addObject:vc4];
	
	vc.titleSelectedColor = MMYS_COLOR;
	vc.subViewControllers = controlArray;
	vc.buttonWidth = kScreenWidth/4;
	vc.buttonHeight = ButtonHeight;
	[vc initSegment];
	[vc addParentController:self];
	[vc didSelectSegmentIndex:index];

}

@end

