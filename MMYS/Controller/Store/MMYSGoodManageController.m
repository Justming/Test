//
//  MMYSGoodManageController.m
//  MMYS
//
//  Created by yangl on 2017/2/8.
//  Copyright © 2017年 Huasheng. All rights reserved.
//

#import "MMYSGoodManageController.h"
#import "MMYSGoodManageCell.h"

@interface MMYSGoodManageController ()
<UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout>
{
	UICollectionView *collection;
}

@end

@implementation MMYSGoodManageController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self createUI];
}

- (void)createUI
{
	self.view.backgroundColor = WHITE_COLOR;
	
	UICollectionViewFlowLayout *flowLayout	= [[UICollectionViewFlowLayout alloc]init];
	flowLayout.minimumLineSpacing			= 10;
	flowLayout.minimumInteritemSpacing		= 10;
	flowLayout.itemSize						= CGSizeMake((kScreenWidth-30)/2, 230);
	
	collection = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 10, kScreenWidth-20, kScreenHeight-kTopBarHeight-20) collectionViewLayout:flowLayout];
	collection.showsVerticalScrollIndicator = FALSE;
	collection.backgroundColor = WHITE_COLOR;
	collection.dataSource	= self;
	collection.delegate	= self;
	//注册
	[collection registerClass:[MMYSGoodManageCell class] forCellWithReuseIdentifier:@"CollectionViewTitleCell"];
	[self.view addSubview:collection];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	MMYSGoodManageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewTitleCell" forIndexPath:indexPath];
	
	return cell;
}

@end
