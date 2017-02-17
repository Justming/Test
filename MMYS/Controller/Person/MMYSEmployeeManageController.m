//
//  MMYSEmployeeManageController.m
//  MMYS
//
//  Created by yangl on 2017/2/13.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSEmployeeManageController.h"
#import "MMYSEmployeeCell.h"
#import "MMYSAddEmployeeController.h"

@interface MMYSEmployeeManageController ()

@end

@implementation MMYSEmployeeManageController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self createUI];
	[self initLayout];
}

- (void)initLayout
{
	self.view.backgroundColor = BG_GRAY_COLOR;
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addEmployee)];
}

- (void)addEmployee
{
	MMYSAddEmployeeController *addEmmployeeVC = [[MMYSAddEmployeeController alloc] init];
	addEmmployeeVC.navigationItem.title = @"添加店员";
	[self.navigationController pushViewController:addEmmployeeVC animated:YES];
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
	MMYSEmployeeCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	if (cell == nil) {
		cell = [[MMYSEmployeeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
	}
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	return cell;
}

@end
