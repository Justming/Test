//
//  APinventoryController.m
//  apparel
//
//  Created by Ding on 16/7/27.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "MMYSOrderDetailController.h"
#import "MMYSOrderCell.h"

@interface MMYSOrderDetailController ()
<
UITableViewDelegate,
UITableViewDataSource,
UIAlertViewDelegate
>
{
    UITableView         *table;
    UIView              *bgView;
    NSMutableArray      *cellArray;
    
    NSInteger           totalPage;
    NSInteger           currentPageIndex;
    NSMutableArray      *pageIndexArray;
    
    BOOL                reload;
    
}
@end

@implementation MMYSOrderDetailController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI
{
    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kTopBarHeight-100) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
	table.backgroundColor = BG_GRAY_COLOR;
    [self.view addSubview:table];
    [table setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellIdap";
    MMYSOrderCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[MMYSOrderCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier: cellId];
    }
	
	[cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

@end
