//
//  MultLookBigImageView.m
//  apparel
//
//  Created by JamHonyZ on 16/9/21.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "MultLookBigImageView.h"
#import "FitConsts.h"
#import "UIImageView+WebCache.h"

@implementation MultLookBigImageView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor blackColor]];
    }
    return self;
}

-(void)scrollViewImageArray:(NSArray *)array andOffset:(NSInteger)offset Delegate:(id<WJLoopViewDelegate>)delegate

{
    if (array.count==0) {
        return;
    }
    NSInteger num=array.count;
    
    [UIView animateWithDuration:0.1f animations:^{
        [self setFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    }];
    
     UIScrollView *scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [scroll setContentSize:CGSizeMake(kScreenWidth*num, 0)];
    scroll.bounces = NO;
    [scroll setShowsVerticalScrollIndicator:NO];
    [scroll setShowsHorizontalScrollIndicator:NO];
    scroll.pagingEnabled = YES;
    scroll.contentInset = UIEdgeInsetsMake(0, 50, 50, 0);
    [self addSubview:scroll];
    
//    for (int i=0; i<array.count; i++) {
//        UIImageView *image=[[UIImageView alloc]init];
//        [image setFrame:CGRectMake(0, 50, kScreenWidth, kScreenHeight-100)];
//        [image sd_setImageWithURL:[NSURL URLWithString:array[i]]];
//        [image setContentMode:UIViewContentModeScaleAspectFit];
//        [image setBackgroundColor:[UIColor whiteColor]];
//        [scroll addSubview:image];
//    }
    
    WJLoopView *loopv1 = [WJLoopView WJLoopViewWithFrame:CGRectMake(0, kScreenHeight/4, kScreenWidth, kScreenHeight/2)   delegate:delegate imageURLs:array placeholderImage:nil timeInterval:20 currentPageIndicatorITintColor:nil pageIndicatorTintColor:nil];
    loopv1.location = WJPageControlAlignmentRight;
    [scroll addSubview:loopv1];
    
    
    
    UITapGestureRecognizer   *tap  = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                                action:@selector(tapDismiss)];
    [scroll addGestureRecognizer:tap];
}

-(void)tapDismiss
{
    [UIView animateWithDuration:0.2f animations:^{
        [self setAlpha:0.1f];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
