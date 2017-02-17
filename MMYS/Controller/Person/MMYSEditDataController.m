//
//  MMYSEditDataController.m
//  MMYS
//
//  Created by Huasheng on 2017/2/14.
//  Created by Huasheng on 2017/2/16.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSEditDataController.h"
#import "MMYSPersonInfoView.h"

@interface MMYSEditDataController ()<MMYSPersonInfoDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    MMYSPersonInfoView * headerView;
}
@end

@implementation MMYSEditDataController


- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [super createUI];
    [self initLayout];
    
}

- (void)initLayout{
    
    self.tableView.backgroundColor = BG_GRAY_COLOR;
    self.navigationItem.title = @"编辑资料";
    self.navigationController.navigationBar.tintColor = WHITE_COLOR;
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    
    //完成按钮
    UIButton * complete = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
    [complete setTitle:@"完成" forState:UIControlStateNormal];
    [complete addTarget:self action:@selector(completeEdit:) forControlEvents:UIControlEventTouchUpInside];
    //返回
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:complete];
    self.navigationItem.rightBarButtonItem = item;
    
    
    headerView = [[MMYSPersonInfoView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-20)];
    headerView.delegate = self;
    self.tableView.tableHeaderView = headerView;
    
}
//信息修改完成，保存后返回
- (void)completeEdit:(UIButton *)btn{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

//修改头像代理方法
- (void)changeHeaderImage:(NSInteger)tagIndex{
    
    NSLog(@"从相册获取图片设置为头像");
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        return;
    }
    
    UIImagePickerController * ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.delegate = self;
    [self presentViewController:ipc animated:YES completion:nil];
    
}

//选择相册图片完成
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"相册图片选取完成！");
    headerView.header.image = info[UIImagePickerControllerOriginalImage];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

@end
