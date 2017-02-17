//
//  MMYSCustomerController.m
//  MMYS
//
//  Created by yangl on 2017/2/12.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSCustomerController.h"

@interface MMYSCustomerController ()

@end

@implementation MMYSCustomerController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self createUI];
	[self initLayout];
}

- (void)initLayout
{
	self.navigationItem.title = @"客户管理";
	self.view.backgroundColor = [UIColor whiteColor];
	
	self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-kTopBarHeight);
	[self.tableView setBackgroundColor:BG_GRAY_COLOR];
	[self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellId = @"cellIdap";
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
	}
	cell.textLabel.text = [NSString stringWithFormat:@"客户 %ld", indexPath.row];
	return cell;
}

@end
