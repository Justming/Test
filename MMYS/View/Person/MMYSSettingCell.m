//
//  MMYSSettingCell.m
//  MMYS
//
//  Created by Huasheng on 2017/2/17.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSSettingCell.h"
#import "FitConsts.h"
@implementation MMYSSettingCell
{
    UIImageView *icon;
    UILabel     *content;
    NSArray     *listNames;
    NSArray     *iconList;
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubViews];
        listNames = @[@"编辑资料", @"关于我们", @"意见反馈"];
        iconList  = @[@"130", @"", @""];
    }
    return self;
}

- (void)addSubViews{
    
    UIView * backView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:backView];
    
    icon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    icon.backgroundColor = [UIColor redColor];
    icon.layer.cornerRadius = 15;
    icon.layer.masksToBounds = YES;
    [backView addSubview:icon];
    
    content = [[UILabel alloc] initWithFrame:CGRectMake(50, 10, 100, self.bounds.size.height-15)];
    content.font = [UIFont systemFontOfSize:18];
    content.textColor = TEXT_COLOR_LEVEL_2;
    [backView addSubview:content];
    
}

- (void)initDataWithIndexPath:(NSIndexPath *)indexPath{
    
    icon.image = [UIImage imageNamed:iconList[indexPath.section + indexPath.row]];
    content.text = listNames[indexPath.section + indexPath.row];
    
    
}

@end
