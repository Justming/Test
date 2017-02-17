//
//  APCollectCellList.h
//
//  Created by   on 16/8/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface APCollectCellList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double number;
@property (nonatomic, strong) NSString *goodsUuid;
@property (nonatomic, assign) double sellBackScore;
@property (nonatomic, assign) double theBuyoutPrice;
@property (nonatomic, strong) NSString *goodsTitle;
@property (nonatomic, assign) double originalPrice;
@property (nonatomic, assign) double discount;
@property (nonatomic, strong) NSString *cover;
@property (nonatomic, strong) NSString *desp;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
