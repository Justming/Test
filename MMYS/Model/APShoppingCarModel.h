//
//  APShoppingCarModel.h
//  APShoppingCarModel
//
//  Created by apple on 16/1/21.
//  Copyright © 2016年. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APShoppingCarModel : NSObject

@property (nonatomic,copy)NSString * goodsName;
@property (nonatomic,copy)NSString * goodsPrice;
@property (nonatomic,copy)NSString * goodsImage;
@property (nonatomic,assign) NSInteger goodsCount;
@property (nonatomic,assign)BOOL isSelected;

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;

@end
