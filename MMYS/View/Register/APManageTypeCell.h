//
//  APManageTypeCell.h
//  apparel
//
//  Created by JamHonyZ on 16/8/31.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APManageTypeCell : UITableViewCell

@property(nonatomic,strong)UIButton *manButton;

@property(nonatomic,strong)UILabel  *manCloth;

@property(nonatomic,strong)UIButton *womanButton;

@property(nonatomic,strong)UILabel *womanCloth;

@property(nonatomic,strong)UIButton *childButton;

@property(nonatomic,strong)UILabel *childCloth;

@property(nonatomic,strong)UITextField *typeAddView;

//存放选择类型
@property(nonatomic,copy)void (^Block)(NSArray *array);
@end
