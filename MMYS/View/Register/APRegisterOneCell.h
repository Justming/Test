//
//  APRegisterOneCell.h
//  apparel
//
//  Created by JamHonyZ on 16/8/6.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APMessageView.h"
#import "QRadioButton.h"

@interface APRegisterOneCell : UITableViewCell

@property(nonatomic,strong)APMessageView *messageView;

@property(nonatomic,strong)UITextField *nameTF;
@property(nonatomic,strong)UITextField *cardIdTF;
@property(nonatomic,strong)UITextField *storeNameTF;
@property(nonatomic,strong)UIButton *addressButton;
@property(nonatomic,strong)UITextField *menTF;
@property(nonatomic,strong)UITextField *addressTF;
@property(nonatomic,strong)UITextField *goodAddress;


@property(nonatomic,strong)QRadioButton *man;
@property(nonatomic,strong)QRadioButton *woman;
@end
