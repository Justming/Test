//
//  MMYSSettingController.m
//  MMYS
//
//  Created by Huasheng on 2017/2/17.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSSettingController.h"
#import "MMYSSettingCell.h"
#import "MMYSEditDataController.h"
#import "FitUserManager.h"
#import "FitTabbarController.h"
@interface MMYSSettingController ()

@end

@implementation MMYSSettingController
{
    NSArray *listNames;
    UIButton *logout;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [super createUI];
    [self initLayout];
    
    

}

- (void)initLayout
{
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    logout = [[UIButton alloc] initWithFrame:CGRectMake(20, 300, kScreenWidth-40, 60)];
    logout.backgroundColor = RED_CLOOR;
    [logout setTitle:@"退出登录" forState:UIControlStateNormal];
    [logout setTitleColor:WHITE_COLOR forState:UIControlStateNormal];
    logout.titleLabel.font = [UIFont systemFontOfSize:20];
    logout.layer.masksToBounds = YES;
    logout.layer.cornerRadius = 8;
    [logout addTarget:self action:@selector(logout:) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview:logout];
    
    
}
#pragma mark 退出登录
- (void)logout:(UIButton *)btn
{
    if ([[FitUserManager sharedUserManager] logout])
    {
        //NSLog(@"退出登录！");
        FitTabbarController * fitTab = [[FitTabbarController alloc] init];
        [self presentViewController:fitTab animated:YES completion:nil];
        
    }
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }else if (section == 1)
    {
        return 2;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MMYSSettingCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MMYSSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = WHITE_COLOR;
    [cell initDataWithIndexPath:indexPath];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section+indexPath.row)
    {
        case 0:
        {
            MMYSEditDataController * editVC = [[MMYSEditDataController alloc] init];
            [self.navigationController pushViewController:editVC animated:YES];
        }
            break;
        case 1:
        {
            NSLog(@"1");
        }
            break;
        case 2:
        {
            NSLog(@"2");
        }
        default:
            break;
    }
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}




@end
