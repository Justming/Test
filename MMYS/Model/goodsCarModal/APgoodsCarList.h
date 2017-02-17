//
//  APgoodsCarList.h
//
//  Created by   on 16/8/28
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface APgoodsCarList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *goodsUuid;
@property (nonatomic, strong) NSArray *buyItems;
@property (nonatomic, strong) NSString *goodsName;

@property(nonatomic,assign)BOOL selected;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
