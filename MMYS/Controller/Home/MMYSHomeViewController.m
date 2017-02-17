//
//  FirNewHomeViewController.m
//  firefly
//
//  Created by Ding on 16/7/3.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "MMYSHomeViewController.h"
#import "MMYSHomeDetailController.h"
#import "UIImageView+WebCache.h"
#import "MMYSHomeListCell.h"
#import "FitConsts.h"
#import "CountDown.h"
#import "WJLoopView.h"
#import "APHomeScrollRequest.h"
#import "APHomeCellRequest.h"
#import "MJRefresh.h"
#import "FitTabbarController.h"

@interface MMYSHomeViewController ()
<
UIAlertViewDelegate,
WJLoopViewDelegate
>
{
    UIView          *headView;
    NSMutableArray  *cellDataArray;
    
    NSInteger        totalPage;
    NSInteger        currentPageIndex;
    NSMutableArray   *pageIndexArray;
}
@property (nonatomic, strong)  NSMutableArray   *ImageArray;

@end

@implementation MMYSHomeViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[super createUI];
    [self initLayout];
    [self requestScrollViewImage];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self cellDataRequest:1 andPageSize:10];
    });
    cellDataArray	= [NSMutableArray arrayWithCapacity:0];
    pageIndexArray	= [NSMutableArray arrayWithCapacity:0];
}

-(void)initLayout
{
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
	
	self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-kTopBarHeight);
    [self.tableView setBackgroundColor:BG_GRAY_COLOR];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	
    [self.view addSubview:self.tableView];
    
    [self setupRefresh];
    
    self.ImageArray	= [NSMutableArray arrayWithCapacity:0];
    headView		= [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 185)];
    self.tableView.tableHeaderView = headView;
    
    UIView *footView	= [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kToolBarHeight)];
    [footView setBackgroundColor:BG_GRAY_COLOR];
    [self.tableView setTableFooterView:footView];
}

#pragma mark 刷新加载部分

- (void)setupRefresh
{
    [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
//	[self.tableView addHeaderWithTarget:self action:@selector()]
	
    self.tableView.headerPullToRefreshText		= @"下拉可以刷新";
    self.tableView.headerReleaseToRefreshText	= @"松开马上刷新";
    self.tableView.headerRefreshingText			= @"正在帮你刷新...";
    
    self.tableView.footerPullToRefreshText		= @"上拉可以加载更多数据";
    self.tableView.footerReleaseToRefreshText	= @"松开马上加载更多数据";
    self.tableView.footerRefreshingText			= @"正在帮你加载...";
}

- (void)footerRereshing
{
    currentPageIndex=cellDataArray.count/10+1;
    
    if (currentPageIndex>=totalPage) {
        [self.tableView footerEndRefreshing];
        [self textStateHUD:@"亲，没有数据了"];
        return;
    }
    // 2.0秒后刷新表格UI
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)
                                 (2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (cellDataArray.count>0) {
            [self cellDataRequest:currentPageIndex andPageSize:10];
        }
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [self.tableView footerEndRefreshing];
    });
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 220;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cellDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    MMYSHomeListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[MMYSHomeListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    MMYSHomeCellList *list	= cellDataArray[indexPath.row];
    
    [cell setCellValue:list];
    
    cell.tag = indexPath.row;
    
    cell.selectionStyle		= UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{	
    MMYSHomeDetailController *nextVC	= [[MMYSHomeDetailController alloc] init];
    
//     MMYSHomeCellList *list			= cellDataArray[indexPath.row];
	
    [nextVC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:nextVC animated:YES];
}

#pragma mark 请求scrollView数据

-(void)requestScrollViewImage
{
    if (![CheckUtils isLink]) {
        
        [self textStateHUD:@"无网络连接"];
        return;
    }
    
    APHomeScrollRequest *request	= [[APHomeScrollRequest alloc]init];
    HTTPProxy   *proxy				= [HTTPProxy loadWithRequest:request
                                           completed:^(NSString *resp, NSStringEncoding encoding) {
                                               
                                               [self performSelectorOnMainThread:@selector(scrollViewImageResponse:)
                                                                      withObject:resp
                                                                   waitUntilDone:YES];
                                           } failed:^(NSError *error) {
                                               
                                               [self performSelectorOnMainThread:@selector(textStateHUD:)
                                                                      withObject:@"数据加载失败"
                                                                   waitUntilDone:YES];
                                           }];
    [proxy start];
}

-(void)scrollViewImageResponse:(NSString *)resp
{
    NSDictionary    *bodyDict   = [VOUtil parseBody:resp];
    
    if (!bodyDict) {
        return;
    }
    
    if (bodyDict && [bodyDict objectForKey:@"result"]
        && [[bodyDict objectForKey:@"result"] isKindOfClass:[NSString class]]){
        
        if ([[bodyDict objectForKey:@"result"] isEqualToString:@"0"]){
            
            NSArray *array	= bodyDict[@"banners"];
            if (array.count>0) {
                
                for (int i=0; i<array.count; i++) {
                    
                    if (array[i][@"linkUrl"]) {
                        [self.ImageArray addObject:array[i][@"linkUrl"]];
                    }
                }
                
                if (self.ImageArray.count>0) {
                    WJLoopView *loopv1 = [WJLoopView WJLoopViewWithFrame:CGRectMake(0, 0, kScreenWidth, 175)   delegate:self imageURLs:self.ImageArray placeholderImage:nil timeInterval:2 currentPageIndicatorITintColor:nil pageIndicatorTintColor:nil];
                    loopv1.location = WJPageControlAlignmentRight;
                    [headView addSubview:loopv1];
                }
            }
        }
    }
}

#pragma mark scrollview代理函数
- (void)WJLoopView:(WJLoopView *)LoopView didClickImageIndex:(NSInteger)index
{
    NSLog(@"图片的索引值为：%ld",(long)index);
}

#pragma mark 主页单元格数据请求

-(void)cellDataRequest:(NSInteger)pageIndex andPageSize:(NSInteger)pageSize
{
    if (![CheckUtils isLink]) {
        
        [self textStateHUD:@"无网络连接"];
        return;
    }
	[self initStateHud];
	
    APHomeCellRequest *request=[[APHomeCellRequest alloc]initWithPageIndex:pageIndex andPageSize:pageSize];
    HTTPProxy   *proxy  = [HTTPProxy loadWithRequest:request
                                           completed:^(NSString *resp, NSStringEncoding encoding) {
                                               
                                               [self performSelectorOnMainThread:@selector(cellDataResponse:)
                                                                      withObject:resp
                                                                   waitUntilDone:YES];
                                           } failed:^(NSError *error) {
                                               
                                               [self textStateHUD:@"请求数据失败"];
                                           }];
    [proxy start];
}

-(void)cellDataResponse:(NSString *)resp
{
	[self hideStateHud];
    NSDictionary    *bodyDict   = [VOUtil parseBody:resp];
    
    if ([bodyDict[@"returnCode"] isEqualToString:@"002"]){
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:nil
                                                     message:reLoginTip
                                                    delegate:self
                                           cancelButtonTitle:nil
                                           otherButtonTitles:@"确定", nil];
        [alert show];
        alert.tag=10;
        return;
    }
	
    if (!bodyDict) {
        
        [self textStateHUD:@"请求数据失败"];
        return;
    }
    if (bodyDict && [bodyDict objectForKey:@"result"]
        && [[bodyDict objectForKey:@"result"] isKindOfClass:[NSString class]]){
        
        if ([[bodyDict objectForKey:@"result"] isEqualToString:@"0"]){
            
            NSString *totalPageStr=bodyDict[@"total"];
            totalPage=[totalPageStr integerValue];
            
            NSMutableArray *array=bodyDict[@"list"];
        
            if (![pageIndexArray containsObject:@(currentPageIndex)]) {
                
                [pageIndexArray addObject:@(currentPageIndex)];
            }else{
                NSLog(@"数组中有该数据");
                return;
            }
            
            for (int i=0; i<array.count; i++) {
                MMYSHomeCellList *list=[[MMYSHomeCellList alloc]initWithDictionary:array[i]];
                if (![cellDataArray containsObject:list]) {
                    [cellDataArray addObject:list];
                }
            }
            [self.tableView reloadData];
        }else
        {
            [self textStateHUD:bodyDict[@"description"]];
        }
    }
}

#pragma mark  UIAlertViewDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [[FitUserManager sharedUserManager] logout];
    FitTabbarController *tab=[[FitTabbarController alloc]init];
    [self presentViewController:tab animated:YES completion:nil];
}

@end
