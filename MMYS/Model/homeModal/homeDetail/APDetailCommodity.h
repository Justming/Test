//
//  APDetailCommodity.h
//
//  Created by   on 16/9/22
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface APDetailCommodity : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double theBuyoutPrice;
@property (nonatomic, strong) NSString *goodsUuid;
@property (nonatomic, assign) double originalPrice;
@property (nonatomic, strong) NSString *textForDetails;
@property (nonatomic, strong) NSString *goodsTitle;
@property (nonatomic, strong) NSArray *carouselFigure;
@property (nonatomic, strong) NSString *desp;
@property (nonatomic, assign) double consignmentPrice;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
