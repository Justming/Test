//
//  FirLawyerToolController.m
//  firefly
//
//  Created by JamHonyZ on 16/1/22.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "MMYSStoreController.h"
#import "MMYSStoreHeaderView.h"
#import "MMYSGoodManageController.h"
#import "MMYSOrderController.h"
#import "MMYSCustomerController.h"
#import "MMYSStoreInfoController.h"
#import "StoreInfoRequest.h"
#import "FitUserManager.h"
@interface MMYSStoreController ()
<MMYSStoreHeaderDelegate>
{
	MMYSStoreHeaderView *headerView;
}

@end

@implementation MMYSStoreController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[super createUI];
	[self initLayout];
    [self sendShopInfoRequest];
}

- (void)initLayout
{
	self.tableView.backgroundColor = BG_GRAY_COLOR;
	
	headerView = [[MMYSStoreHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 445)];
	headerView.delegate = self;
	self.tableView.tableHeaderView = headerView;
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	cell.backgroundColor = WHITE_COLOR;
	cell.textLabel.text = @"店铺星级";
	cell.textLabel.font = TEXT_FONT_LEVEL_2;
	cell.textLabel.textColor = TEXT_COLOR_LEVEL_2;
	return cell;
}

#pragma mark 店铺信息请求
- (void)sendShopInfoRequest
{
    if (![CheckUtils isLink]) {
        
        [self textStateHUD:@"无网络连接"];
        return;
    }
    //1487223976325133461486333224
    StoreInfoRequest * request = [[StoreInfoRequest alloc] initWithShopUuid:[[FitUserManager sharedUserManager] uuid]];
    
    HTTPProxy * proxy = [HTTPProxy loadWithRequest:request
                                   completed:^(NSString *resp, NSStringEncoding encoding)
                                    {
                                        [self performSelectorOnMainThread:@selector(parseCodeResponse:)
                                                               withObject:resp
                                                            waitUntilDone:YES];
                                    }
                                    failed:^(NSError *error)
                                    {
                                        [self performSelectorOnMainThread:@selector(textStateHUD:)
                                                               withObject:@"请求失败"
                                                            waitUntilDone:YES];
                                    }];
    
    [proxy start];
}
#pragma mark 请求店铺信息响应方法
- (void)parseCodeResponse:(NSString *)resp
{
    
    NSDictionary    *bodyDict   = [VOUtil parseBody:resp];
    
    [headerView addStoreInfoWithData:[bodyDict objectForKey:@"info"]];
    
    [self.tableView reloadData];
}



#pragma mark 六个按钮的代理方法
- (void)gotoNextPage:(NSInteger)tagIndex
{
	switch (tagIndex) {
		case 100:
			{
				MMYSOrderController *totalOrderVC = [[MMYSOrderController alloc] initWithIndex:10000];
				[self.navigationController pushViewController:totalOrderVC animated:YES];
				break;
			}
		case 101:
			{
				MMYSOrderController *payOrderVC = [[MMYSOrderController alloc] initWithIndex:10001];
				[self.navigationController pushViewController:payOrderVC animated:YES];
				break;
			}
			
		case 102:
			{
				MMYSOrderController *sendOrderVC = [[MMYSOrderController alloc] initWithIndex:10002];
				[self.navigationController pushViewController:sendOrderVC animated:YES];
				break;
			}
			
		case 103:
			{
				MMYSOrderController *completeOrderVC = [[MMYSOrderController alloc] initWithIndex:10003];
				[self.navigationController pushViewController:completeOrderVC animated:YES];
				break;
			}
			
		case 104:
			{
				MMYSGoodManageController *goodManageVC = [[MMYSGoodManageController alloc] init];
				goodManageVC.title = @"商品管理";
				[self.navigationController pushViewController:goodManageVC animated:YES];
				break;
			}
			
		case 105:
			{
				MMYSCustomerController *customerVC = [[MMYSCustomerController alloc] init];
				customerVC.title = @"客户管理";
				[self.navigationController pushViewController:customerVC animated:YES];
				break;
			}
			
		case 106:
			{
				MMYSStoreInfoController *storeInfoVC = [[MMYSStoreInfoController alloc] init];
				storeInfoVC.title = @"店铺信息";
				[self.navigationController pushViewController:storeInfoVC animated:YES];
				break;
			}
			
		default:
			break;
	}
}

@end
