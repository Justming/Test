//
//  MMYSAddEmployeeController.m
//  MMYS
//
//  Created by yangl on 2017/2/13.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSAddEmployeeController.h"

@interface MMYSAddEmployeeController ()
{
	UITextField *nameTF;
	UITextField *phoneTF;
}
@end

@implementation MMYSAddEmployeeController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self createUI];
}

- (void)createUI
{
	self.view.backgroundColor = WHITE_COLOR;
	
	UILabel *nameTip = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 50, 50)];
	nameTip.text = @"姓名";
	nameTip.font = TEXT_FONT_LEVEL_1;
	nameTip.textColor = TEXT_COLOR_LEVEL_2;
	[self.view addSubview:nameTip];
	
	nameTF = [[UITextField alloc] initWithFrame:CGRectMake(70, 0, 100, 50)];
	nameTF.placeholder = @"输入员工姓名";
	nameTF.font = TEXT_FONT_LEVEL_2;
	nameTF.textColor = TEXT_COLOR_LEVEL_2;
	[self.view addSubview:nameTF];
	
	UILabel *phoneTip = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 50, 50)];
	phoneTip.text = @"手机号";
	phoneTip.font = TEXT_FONT_LEVEL_1;
	phoneTip.textColor = TEXT_COLOR_LEVEL_2;
	[self.view addSubview:phoneTip];
	
	phoneTF = [[UITextField alloc] initWithFrame:CGRectMake(70, 50, 200, 50)];
	phoneTF.placeholder = @"请输入员工手机号";
	phoneTF.font = TEXT_FONT_LEVEL_2;
	phoneTF.textColor = TEXT_COLOR_LEVEL_2;
	[self.view addSubview:phoneTF];
	
	UILabel *line1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, kScreenWidth, 0.5)];
	line1.backgroundColor = BG_GRAY_COLOR;
	[self.view addSubview:line1];
	
	UILabel *line2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, 0.5)];
	line2.backgroundColor = BG_GRAY_COLOR;
	[self.view addSubview:line2];
	
	UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	addBtn.frame = CGRectMake((kScreenWidth-150)/2, 150, 150, 40);
	[addBtn setTitle:@"确定添加" forState:UIControlStateNormal];
	addBtn.titleLabel.font = TEXT_FONT_LEVEL_1;
	addBtn.backgroundColor = MMYS_COLOR;
	addBtn.layer.cornerRadius = 5;
	addBtn.clipsToBounds = YES;
	[self.view addSubview:addBtn];
	[addBtn addTarget:self action:@selector(addEmployee) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addEmployee
{
	[self.navigationController popViewControllerAnimated:YES];
}

@end
