//
//  FitPickerThreeLevelView.m
//  apparel
//
//  Created by JamHonyZ on 16/9/20.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitPickerThreeLevelView.h"
#import "FitConsts.h"

@implementation FitPickerThreeLevelView
{
    NSDictionary *areaDic;
    NSArray *province;
    NSArray *city;
    NSArray *district;
    NSString *selectedProvince;
    
    NSString *provinceStr;
    NSString *cityStr;
    NSString *districtStr;
    NSString *selectedAddress;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor    = [UIColor whiteColor];
        [self _initSubviews];
    }
    return self;
}

- (void)_initSubviews
{
    _viewMask   = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    
    _viewMask.backgroundColor    = [UIColor blackColor];
    _viewMask.alpha              = 0;
    
    UITapGestureRecognizer  *tapGR  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissSelf)];
    [_viewMask addGestureRecognizer:tapGR];

    [[[[UIApplication sharedApplication] delegate] window] addSubview:_viewMask];
    
    [UIView animateWithDuration:0.2 animations:^{
        
        _viewMask.alpha      = 0.2;
        self.frame    = CGRectMake(0, kScreenHeight - 260, kScreenWidth, 260);
    }];
    
    UIView   *toolBar       = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    toolBar.backgroundColor = BG_GRAY_COLOR;
    
    UIView  *line   = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, .5)];
    line.backgroundColor    = LINE_COLOR;
    
    [toolBar addSubview:line];
    
    UIButton    *cancelBtn  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 44)];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:BLUE_COLOR forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(dismissSelf) forControlEvents:UIControlEventTouchUpInside];
    
    [toolBar addSubview:cancelBtn];
    
    UIButton    *confirmBtn     = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - 70, 0, 70, 44)];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:BLUE_COLOR forState:UIControlStateNormal];
    [confirmBtn addTarget:self action:@selector(confirmItemPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [toolBar addSubview:confirmBtn];
    
    [self addSubview:toolBar];
    
    [self getAreaData];
    
    _pickerView     = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, 216)];
    _pickerView.delegate    = self;
    _pickerView.dataSource  = self;
    
    [self addSubview:_pickerView];
}

-(void)getAreaData
{
     NSString *plistPath     = [[NSBundle mainBundle] pathForResource:@"area" ofType:@"plist"];
    areaDic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    NSArray *components = [areaDic allKeys];
    NSArray *sortedArray = [components sortedArrayUsingComparator: ^(id obj1, id obj2) {
        
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    NSMutableArray *provinceTmp = [[NSMutableArray alloc] init];
    for (int i=0; i<[sortedArray count]; i++) {
        NSString *index = [sortedArray objectAtIndex:i];
        NSArray *tmp = [[areaDic objectForKey: index] allKeys];
        [provinceTmp addObject: [tmp objectAtIndex:0]];
    }
    
    province = [[NSArray alloc] initWithArray: provinceTmp];
    
    NSString *index = [sortedArray objectAtIndex:0];
    NSString *selected = [province objectAtIndex:0];
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary: [[areaDic objectForKey:index]objectForKey:selected]];
    
    NSArray *cityArray = [dic allKeys];
    NSDictionary *cityDic = [NSDictionary dictionaryWithDictionary: [dic objectForKey: [cityArray objectAtIndex:0]]];
    city = [[NSArray alloc] initWithArray: [cityDic allKeys]];
    
    NSString *selectedCity = [city objectAtIndex: 0];
    district = [[NSArray alloc] initWithArray: [cityDic objectForKey: selectedCity]];
    
    selectedAddress =[NSString stringWithFormat:@"%@ %@ %@",[province objectAtIndex: 0],[city objectAtIndex: 0],[district objectAtIndex: 0]];
}

// pickerView 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

// pickerView 每列个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component==0) {
         return [province count];
    }
    if (component==1) {
        return [city count];
    }
    if (component==2) {
        return [district count];
    }
    return 0;
}

// 返回选中的行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
       if (component == 0) {
        selectedProvince = [province objectAtIndex: row];
        NSDictionary *tmp = [NSDictionary dictionaryWithDictionary: [areaDic objectForKey: [NSString stringWithFormat:@"%ld", (long)row]]];
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary: [tmp objectForKey: selectedProvince]];
        NSArray *cityArray = [dic allKeys];
        NSArray *sortedArray = [cityArray sortedArrayUsingComparator: ^(id obj1, id obj2) {
            
            if ([obj1 integerValue] > [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedDescending;//递减
            }
            
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedAscending;//上升
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
        
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (int i=0; i<[sortedArray count]; i++) {
            NSString *index = [sortedArray objectAtIndex:i];
            NSArray *temp = [[dic objectForKey: index] allKeys];
            [array addObject: [temp objectAtIndex:0]];
        }
        
        city = [[NSArray alloc] initWithArray: array];
        
        NSDictionary *cityDic = [dic objectForKey: [sortedArray objectAtIndex: 0]];
        district = [[NSArray alloc] initWithArray: [cityDic objectForKey: [city objectAtIndex: 0]]];
        
        [_pickerView selectRow: 0 inComponent: 1 animated: YES];
        [_pickerView selectRow: 0 inComponent: 2 animated: YES];
        [_pickerView reloadComponent: 1];
        [_pickerView reloadComponent: 2];
    }
     if (component == 1) {
        NSString *provinceIndex = [NSString stringWithFormat: @"%lu", (unsigned long)[province indexOfObject: selectedProvince]];
        NSDictionary *tmp = [NSDictionary dictionaryWithDictionary: [areaDic objectForKey: provinceIndex]];
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary: [tmp objectForKey: selectedProvince]];
        NSArray *dicKeyArray = [dic allKeys];
        NSArray *sortedArray = [dicKeyArray sortedArrayUsingComparator: ^(id obj1, id obj2) {
            
            if ([obj1 integerValue] > [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
        
        NSDictionary *cityDic = [NSDictionary dictionaryWithDictionary: [dic objectForKey: [sortedArray objectAtIndex: row]]];
        NSArray *cityKeyArray = [cityDic allKeys];
        
        district = [[NSArray alloc] initWithArray: [cityDic objectForKey: [cityKeyArray objectAtIndex:0]]];
        [_pickerView selectRow: 0 inComponent: 2 animated: YES];
        [_pickerView reloadComponent: 2];
    }
    
    if (component==0) {
        provinceStr=[NSString stringWithFormat:@"%ld",(long)row];
    
        provinceStr=province[row];
        cityStr=city[0];
        districtStr=district[0];
    }
    if (component==1) {
         cityStr=[NSString stringWithFormat:@"%ld",(long)row];
         cityStr=city[row];
         districtStr=district[0];
    }
    if (component==2) {
         districtStr=[NSString stringWithFormat:@"%ld",(long)row];
        districtStr=district[row];
    }
    selectedAddress=[NSString stringWithFormat:@"%@ %@ %@",provinceStr,cityStr,districtStr];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *myView = nil;
    
    if (component == 0) {
        
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 30)];
        
        myView.textAlignment = NSTextAlignmentCenter;
        
        myView.text = [province objectAtIndex:row];
        
        myView.font = [UIFont systemFontOfSize:14];
        
        myView.backgroundColor = [UIColor clearColor];
        
    }
    if (component==1) {
        
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 30)];
        
        myView.text = [city objectAtIndex: row];
        
        myView.textAlignment = NSTextAlignmentCenter;
        
        myView.font = [UIFont systemFontOfSize:14];
        
        myView.backgroundColor = [UIColor clearColor];
    }
    
    if (component==2) {
        
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 100, 30)];
        
        myView.text = [district objectAtIndex: row];
        
        myView.textAlignment = NSTextAlignmentCenter;
        
        myView.font = [UIFont systemFontOfSize:14];
        
        myView.backgroundColor = [UIColor clearColor];
    }
    return myView;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == 0) {
        return 100;
    }
    else if (component == 1) {
        return 100;
    }
    else {
        return 100;
    }
}

- (void)dismissSelf
{
    [UIView animateWithDuration:0.2 animations:^{
        
        self.frame  = CGRectMake(0, kScreenHeight, kScreenWidth, self.frame.size.height);
        self.viewMask.alpha = 0;
    } completion:^(BOOL finished) {
        
        [self.viewMask removeFromSuperview];
        [self removeFromSuperview];
    }];
}

- (void)confirmItemPressed
{
    NSMutableArray      *items  = [NSMutableArray new];
    
    [items addObject:selectedAddress];
//
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectedItems:)]) {
        
        [_delegate didSelectedItems:items];
    }
    [self dismissSelf];
}

@end
