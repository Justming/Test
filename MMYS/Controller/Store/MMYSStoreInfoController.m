//
//  MMYSStoreInfoController.m
//  MMYS
//
//  Created by Huasheng on 2017/2/14.
//  Created by yangl on 2017/2/12.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSStoreInfoController.h"
#import "MMYSStoreInfoView.h"
#import "FitConsts.h"
@interface MMYSStoreInfoController ()<MMYSStoreHeaderDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation MMYSStoreInfoController
{
    MMYSStoreInfoView * headerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self createUI];
}

- (void)createUI
{
    self.view.backgroundColor = WHITE_COLOR;    
    headerView = [[MMYSStoreInfoView alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, 180)];
    headerView.delegate = self;
    [self.view addSubview:headerView];
    
}

- (void)getHeaderFromPhoto{
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        return;
    }
    
    UIImagePickerController * ipc = [[UIImagePickerController alloc] init];
    
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    ipc.delegate = self;
    
    [self presentViewController:ipc animated:YES completion:nil];
    
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    headerView.headerImage.image = info[UIImagePickerControllerOriginalImage];
    
}
@end
