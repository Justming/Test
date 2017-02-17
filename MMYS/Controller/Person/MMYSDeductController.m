//
//  MMYSDeductController.m
//  MMYS
//
//  Created by yangl on 2017/2/13.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSDeductController.h"
#import "MMYSDeductCell.h"

@interface MMYSDeductController ()

@end

@implementation MMYSDeductController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self createUI];
	[self initLayout];
}

- (void)initLayout
{
	self.view.backgroundColor = BG_GRAY_COLOR;
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
	return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellId = @"cellIdap";
	MMYSDeductCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	if (cell == nil) {
		cell = [[MMYSDeductCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
	}
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	return cell;
}
@end
