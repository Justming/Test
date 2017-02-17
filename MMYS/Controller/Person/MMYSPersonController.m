//
//  FirPersonCenterController.m
//  firefly
//
//  Created by Ding on 16/6/15.
//  Copyright © 2016年 Huasheng. All rights reserved.
//
#import "MMYSPersonController.h"
#import "FitConsts.h"
#import "MMYSPeronHeaderView.h"
#import "MMYSUncollectedRevenueController.h"
#import "MMYSCumulativeRevenueController.h"
#import "MMYSEmployeeManageController.h"
#import "MMYSDeductController.h"
#import "MMYSEditDataController.h"
#import "MMYSSettingController.h"
@interface MMYSPersonController ()
<
MMYSPersonHeaderDelegate
>

{
	MMYSPeronHeaderView *headerView;
	NSArray *listName;
}
@end

@implementation MMYSPersonController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [super createUI];
    [self initLayout];
	listName = @[@"设置", @"版本信息"];
}

- (void)initLayout
{
	self.navigationItem.title = @"个人";
	self.tableView.backgroundColor = BG_GRAY_COLOR;
	
	headerView = [[MMYSPeronHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 350)];
    headerView.delegate = self;
	self.tableView.tableHeaderView = headerView;
	
	headerView.delegate = self;
}

#pragma mark 头部代理，按钮跳转
- (void)tapNextPage:(NSInteger)tagIndex
{
	switch (tagIndex) {
		case 100:
		{
			MMYSUncollectedRevenueController *unRevenueVC = [[MMYSUncollectedRevenueController alloc] init];
			unRevenueVC.navigationItem.title = @"待收收益";
			[self.navigationController pushViewController:unRevenueVC animated:YES];
			break;
		}
		case 101:
		{
			MMYSCumulativeRevenueController *cumRevenueVC = [[MMYSCumulativeRevenueController alloc] init];
			cumRevenueVC.navigationItem.title = @"累计收益";
			[self.navigationController pushViewController:cumRevenueVC animated:YES];
			break;
		}
		case 102:
		{
			MMYSEmployeeManageController *employeeVC = [[MMYSEmployeeManageController alloc] init];
			employeeVC.navigationItem.title = @"店员管理";
			[self.navigationController pushViewController:employeeVC animated:YES];
			break;
		}
		case 103:
		{
			MMYSDeductController *deductVC = [[MMYSDeductController alloc] init];
			deductVC.navigationItem.title = @"店员提成";
			[self.navigationController pushViewController:deductVC animated:YES];
			break;
		}
        case 1000:
        {
            MMYSEditDataController * editDataVC = [[MMYSEditDataController alloc] init];
            editDataVC.navigationItem.title = @"编辑资料";
            [self.navigationController pushViewController:editDataVC animated:YES];
            break;
        }
		default:
			break;
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.backgroundColor = WHITE_COLOR;
	cell.textLabel.text = listName[indexPath.row];
	cell.textLabel.font = TEXT_FONT_LEVEL_2;
	cell.textLabel.textColor = TEXT_COLOR_LEVEL_2;
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:
        {
            MMYSSettingController * setVC = [[MMYSSettingController alloc] init];
            setVC.navigationItem.title = @"设置";
            setVC.view.backgroundColor = WHITE_COLOR;
            [self.navigationController pushViewController:setVC animated:YES];
            break;
        }
        case 1:
        {
            NSLog(@"%ld", indexPath.row);
            break;
        }
        default:
            break;
    }
    
    
}



//编辑信息按钮代理方法
- (void)gotoNextPage:(NSInteger)tagIndex{
    
    if (tagIndex == 1000) {
        MMYSEditDataController * vc = [[MMYSEditDataController alloc] init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
