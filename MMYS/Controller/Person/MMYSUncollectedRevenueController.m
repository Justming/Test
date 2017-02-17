//
//  MMYSUncollectedRevenueController.m
//  MMYS
//
//  Created by yangl on 2017/2/12.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSUncollectedRevenueController.h"
#import "MMYSUncollectedCell.h"

@interface MMYSUncollectedRevenueController ()
{
	NSArray *cellContext;
	NSArray *cellPlaceholder;
}
@end

@implementation MMYSUncollectedRevenueController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self createUI];
	[self initLayout];
}

- (void)initLayout
{
	cellContext = @[@[@"待收金额"], @[@"账户", @"卡号", @"提现金额"]];
	cellPlaceholder = @[@"输入账号信息", @"输入储蓄卡号", @"输入提现金额"];
	self.view.backgroundColor = BG_GRAY_COLOR;
//	self.tableView.frame = CGRectMake(0, 0, kScreenWidth, 220);

	UIButton *withdrawBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	withdrawBtn.frame = CGRectMake((kScreenWidth-170)/2, 270, 170, 45);
	[withdrawBtn setTitle:@"提现" forState:UIControlStateNormal];
	withdrawBtn.backgroundColor = MMYS_COLOR;
	[withdrawBtn setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
	withdrawBtn.titleLabel.font = TEXT_FONT_LEVEL_1;
	withdrawBtn.layer.cornerRadius = 3;
	withdrawBtn.layer.masksToBounds = YES;
	[withdrawBtn addTarget:self action:@selector(withdraw) forControlEvents:UIControlEventTouchUpInside];
	[self.tableView addSubview:withdrawBtn];
}

- (void)withdraw
{
	[self textStateHUD:@"提现"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section == 1) {
		return 3;
	}
	return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellId = @"cellIdap";
	MMYSUncollectedCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	if (cell == nil) {
		cell = [[MMYSUncollectedCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
	}
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
	cell.textL = cellContext[indexPath.section][indexPath.row];
	if (indexPath.section == 0) {
		cell.textField.text = @"￥0.00";
		cell.userInteractionEnabled = NO;
	}
	if (indexPath.section == 1) {
		cell.textField.placeholder = cellPlaceholder[indexPath.row];
	}
	return cell;
}

@end
