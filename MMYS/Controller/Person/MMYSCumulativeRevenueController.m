//
//  MMYSCumulativeRevenueController.m
//  MMYS
//
//  Created by yangl on 2017/2/12.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSCumulativeRevenueController.h"

@interface MMYSCumulativeRevenueController ()
{
	NSArray *contextArr;
}
@end

@implementation MMYSCumulativeRevenueController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self createUI];
	[self initLayout];
}

- (void)initLayout
{
	self.view.backgroundColor = BG_GRAY_COLOR;
	contextArr = @[@[@"累计收益："], @[@"今日收益：", @"本周收益：", @"本月收益：", @"全年收益："]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section == 1) {
		return 4;
	}
	return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == 0) {
		return 50;
	}
	return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellId = @"cellIdap";
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
	}
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.textLabel.text = contextArr[indexPath.section][indexPath.row];
	cell.textLabel.font = TEXT_FONT_LEVEL_2;
	cell.textLabel.textColor = TEXT_COLOR_LEVEL_2;
	return cell;
}

@end
