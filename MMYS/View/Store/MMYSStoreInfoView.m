//
//  MMYSStoreInfoView.m
//  MMYS
//

//  Created by Huasheng on 2017/2/14.

//  Created by Huasheng on 2017/2/16.

//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSStoreInfoView.h"
#import "FitConsts.h"

@implementation MMYSStoreInfoView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = WHITE_COLOR;
        [self addSubViews];
    }
    return self;
    
}

- (void)addSubViews{
    
    self.userInteractionEnabled = YES;
    
    //头像
    UILabel * header = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 50, 60)];
    header.text = @"头像";
    header.textColor = TEXT_COLOR_LEVEL_2;
    header.font = TEXT_FONT_LEVEL_1;
    [self addSubview:header];
    
    _headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth-60, 10, 40, 40)];
    _headerImage.layer.cornerRadius = 20;
    _headerImage.layer.masksToBounds = YES;
    _headerImage.backgroundColor = RED_CLOOR;
    _headerImage.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHeader:)];
    [_headerImage addGestureRecognizer:tap];
    [self addSubview:_headerImage];
    
    //分割线
    UILabel * gap = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, kScreenWidth, 1)];
    gap.backgroundColor = BG_GRAY_COLOR;
    [self addSubview:gap];
    
    //昵称
    UILabel * name = [[UILabel alloc] initWithFrame:CGRectMake(10, 61, 50, 60)];
    name.text = @"昵称";
    name.textColor = TEXT_COLOR_LEVEL_2;
    name.font = TEXT_FONT_LEVEL_1;
    [self addSubview:name];


    UILabel * nameValue = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-70, 61, 100, 60)];
    nameValue.text = @"萧敬腾";
    nameValue.textColor = TEXT_COLOR_LEVEL_4;
    //[nameValue setValue:TEXT_COLOR_LEVEL_4 forKeyPath:@"_placeholderLabel.textColor"];
    [self addSubview:nameValue];
    
    //分割线
    UILabel * nextGap = [[UILabel alloc] initWithFrame:CGRectMake(0, 121, kScreenWidth, 1)];
    nextGap.backgroundColor = BG_GRAY_COLOR;
    [self addSubview:nextGap];
    
    //店铺序号
    UILabel * number = [[UILabel alloc] initWithFrame:CGRectMake(10, 122, 70, 60)];
    number.text = @"店铺序号";
    number.textColor = TEXT_COLOR_LEVEL_2;
    number.font = TEXT_FONT_LEVEL_1;
    [self addSubview:number];
    
    UILabel * numValue = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-60, 122, 70, 60)];
    numValue.text = @"096";
    numValue.textColor = TEXT_COLOR_LEVEL_4;
    numValue.font = TEXT_FONT_LEVEL_1;
    [self addSubview:numValue];
    
}

- (void)tapHeader:(UITapGestureRecognizer *)tap{
    
    NSLog(@"换头像");
    //[self.delegate getHeaderFromPhoto];
}

@end
