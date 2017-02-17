//
//  FitTabbarController.m
//  FitTrainer
//
//  Created by Huasheng on 15/8/20.
//  Copyright (c) 2015年 Huasheng. All rights reserved.
//

#import "FitTabbarController.h"
#import "FitUserManager.h"
#import "FitNavigationController.h"
#import "FitLoginController.h"
#import "MMYSFoundController.h"
#import "MMYSStoreController.h"
#import "MMYSPersonController.h"
#import "MMYSHomeViewController.h"
#import "UITabBar+Badge.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation FitTabbarController

- (id)init
{
    self = [super init];
    if (self)
    {
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self createUI];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (![[FitUserManager sharedUserManager] isLogin]) {
        
        [FitLoginController presentInViewController:self Animated:YES];
    }else{
        [self createUI];
    }
}

- (void)createUI
{
   
    [self.tabBar setTintColor:MMYS_COLOR];
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10]}
                                            forState:UIControlStateNormal];
   
    //设置工具栏中文字的偏移量
    [[UITabBarItem appearance]setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    
    MMYSHomeViewController    *homeVC = [[MMYSHomeViewController alloc] init];
    
    homeVC.title    = @"首页";
    
    FitNavigationController     *homeNav    = [[FitNavigationController alloc] initWithRootViewController:homeVC];
    
    UITabBarItem *itemHome=[[UITabBarItem alloc]initWithTitle:@"首页"
                                                        image:[UIImage imageNamed:@"mmysHome"]
                                                selectedImage:[UIImage imageNamed:@"mmysHome"]];
    
    [homeNav setTabBarItem:itemHome];
    
    MMYSFoundController    *secondVC = [[MMYSFoundController alloc] init];

    secondVC.title    = @"发现";
    
    FitNavigationController     *secondNav    = [[FitNavigationController alloc] initWithRootViewController:secondVC];
    
    UITabBarItem *itemTrip=[[UITabBarItem alloc]initWithTitle:@"发现"
                                                        image:[UIImage imageNamed:@"mmysFind"]
                                                selectedImage:[UIImage imageNamed:@"mmysFind"]];
    [secondNav setTabBarItem:itemTrip];
    
    MMYSStoreController    *thirdVC = [[MMYSStoreController alloc] init];
    
    thirdVC.title    = @"店铺";
    UITabBarItem *itemHealth=[[UITabBarItem alloc]initWithTitle:@"店铺"
                                                          image:[UIImage imageNamed:@"mmysStore"]
                                                  selectedImage:[UIImage imageNamed:@"mmysStore"]];
    
    FitNavigationController     *thirdNav    = [[FitNavigationController alloc] initWithRootViewController:thirdVC];
    
    [thirdNav setTabBarItem:itemHealth];
    
    MMYSPersonController    *fourthVC = [[MMYSPersonController alloc] init];

    
    UITabBarItem * itemMe=[[UITabBarItem alloc]initWithTitle:@"个人"
                                                      image:[UIImage imageNamed:@"mmysPerson"]
                                              selectedImage:[UIImage imageNamed:@"mmysPerson"]];
    
    FitNavigationController     *fourthNav    = [[FitNavigationController alloc] initWithRootViewController:fourthVC];
    
    [fourthNav setTabBarItem:itemMe];
    
    
    self.tabBarController.tabBar.tintColor=[UIColor colorWithRed:236.0/255.0 green:103.0/255.0 blue:112.0/255.0 alpha:1.0];
    
    self.viewControllers    = [NSArray arrayWithObjects:homeNav,secondNav,thirdNav, fourthNav,nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

@end
