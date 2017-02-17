//
//  APDetailSkus.h
//
//  Created by   on 16/9/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface APDetailSkus : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *lists;
@property (nonatomic, strong) NSString *size;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
