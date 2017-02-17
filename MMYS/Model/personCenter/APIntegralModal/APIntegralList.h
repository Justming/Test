//
//  APIntegralList.h
//
//  Created by   on 16/9/8
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface APIntegralList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double amount;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *integralDetailUuid;
@property (nonatomic, strong) NSString *datetime;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
