//
//  APHomeCellList.h
//
//  Created by   on 16/8/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MMYSHomeCellList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *endTime;
@property (nonatomic, strong) NSString *specialName;
@property (nonatomic, strong) NSString *activity;
@property (nonatomic, strong) NSString *addTime;
@property (nonatomic, strong) NSString *specialUuid;
@property (nonatomic, strong) NSString *specialDescription;
@property (nonatomic, strong) NSString *specialPicture;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
