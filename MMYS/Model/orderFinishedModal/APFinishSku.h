//
//  APFinishSku.h
//
//  Created by   on 16/8/23
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface APFinishSku : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *goodsSize;
@property (nonatomic, strong) NSString *picture;
@property (nonatomic, strong) NSString *goodsColor;
@property (nonatomic, strong) NSString *skuUuid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
