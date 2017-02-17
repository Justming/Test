//
//  MMYSFoundController.m
//  MMYS
//
//  Created by yangl on 2017/2/8.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSFoundController.h"
#import "MMYSFoundCell.h"

@interface MMYSFoundController ()

@end

@implementation MMYSFoundController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self createUI];
	[self initLayout];
}

- (void)initLayout
{
	self.view.backgroundColor = BG_GRAY_COLOR;
	self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kNormalHeight);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 260;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellId = @"cellIdap";
	MMYSFoundCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	if (cell == nil) {
	cell = [[MMYSFoundCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
	}
	
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	return cell;
}

@end
