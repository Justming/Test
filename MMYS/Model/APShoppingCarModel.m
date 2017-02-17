//
//  APShoppingCarModel.m
//  APShoppingCarModel
//
//  Created by apple on 11.
//  Copyright © 2016年. All rights reserved.
//

#import "APShoppingCarModel.h"

@implementation APShoppingCarModel

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary
{
    APShoppingCarModel * model = [[APShoppingCarModel alloc]init];
    [model setValuesForKeysWithDictionary:dictionary];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    //容错处理
}

@end
