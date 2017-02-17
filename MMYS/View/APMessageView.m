//
//  APMessageView.m
//  apparel
//
//  Created by Ding on 16/7/28.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APMessageView.h"
#import "FitConsts.h"

@implementation APMessageView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubviews];
        
    }
    return self;
}

-(void)addSubviews
{
    //姓名
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 65, 30)];
    name.font = TEXT_FONT_LEVEL_2;
    name.text = @"输入姓名";
    [self addSubview:name];
    
    UIView *botLine = [[UIView alloc] initWithFrame:CGRectMake(75, 35, kScreenWidth - 75, 0.5)];
    
    botLine.backgroundColor = LINE_COLOR;
    [self addSubview:botLine];
    
    //性别
    UILabel *sex = [[UILabel alloc] initWithFrame:CGRectMake(10, 45, 65, 30)];
    sex.font = TEXT_FONT_LEVEL_2;
    sex.text = @"选择性别";
    [self addSubview:sex];
    
    //年龄
//    UILabel *age = [[UILabel alloc] initWithFrame:CGRectMake(10, 85, 65, 30)];
//    age.font = TEXT_FONT_LEVEL_2;
//    age.text = @"选择年龄";
//    [self addSubview:age];
    
    //身份证号码
    UILabel *cardid = [[UILabel alloc] initWithFrame:CGRectMake(10, 85, 65, 30)];
    cardid.font = TEXT_FONT_LEVEL_2;
    cardid.text = @"身份号码";
    [self addSubview:cardid];
    
    UIView *botLine2 = [[UIView alloc] initWithFrame:CGRectMake(75, 115, kScreenWidth - 75, 0.5)];
    
    botLine2.backgroundColor = LINE_COLOR;
    [self addSubview:botLine2];
    
    //门店名称
    UILabel *storeName = [[UILabel alloc] initWithFrame:CGRectMake(10, 125, 65, 30)];
    storeName.font = TEXT_FONT_LEVEL_2;
    storeName.text = @"门店名称";
    [self addSubview:storeName];
    
    UIView *botLine3 = [[UIView alloc] initWithFrame:CGRectMake(75, 155, kScreenWidth - 75, 0.5)];
    
    botLine3.backgroundColor = LINE_COLOR;
    [self addSubview:botLine3];
    
    
    //门店地址
    UILabel *address = [[UILabel alloc] initWithFrame:CGRectMake(10, 165, 65, 30)];
    address.font = TEXT_FONT_LEVEL_2;
    address.text = @"门店地址";
    [self addSubview:address];
    
    UIView *botLine33 = [[UIView alloc] initWithFrame:CGRectMake(75, 195, kScreenWidth - 75, 0.5)];
    
    botLine33.backgroundColor = LINE_COLOR;
    [self addSubview:botLine33];

    
    //地址详情
    UILabel *detailAD = [[UILabel alloc] initWithFrame:CGRectMake(10, 205, 65, 30)];
    detailAD.font = TEXT_FONT_LEVEL_2;
    detailAD.text = @"地址详情";
    [self addSubview:detailAD];
    UIView *botLine4 = [[UIView alloc] initWithFrame:CGRectMake(75, 235, kScreenWidth - 75, 0.5)];
    
    botLine4.backgroundColor = LINE_COLOR;
    [self addSubview:botLine4];
    
    //收货地址
    UILabel *goodAddress = [[UILabel alloc] initWithFrame:CGRectMake(10, 245, 65, 30)];
    goodAddress.font = TEXT_FONT_LEVEL_2;
    goodAddress.text = @"收货地址";
    [self addSubview:goodAddress];
}

@end
