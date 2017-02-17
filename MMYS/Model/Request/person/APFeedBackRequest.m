//
//  APFeedBackRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/15.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APFeedBackRequest.h"

@implementation APFeedBackRequest

- (id)initWithFeedbackContent:(NSString *)feedback_content

{
    self = [super init];
    if (self)
    {
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (feedback_content) {
            [bodyDict setObject:feedback_content forKey:@"feedback_content"];
        }
        
        NSMutableDictionary     *paramsDict = [self params];
        [paramsDict setObject:bodyDict forKey:@"body"];
    }
    
    return self;
}

- (BOOL)isPost
{
    return YES;
}

- (NSString *)methodPath
{
    return @"feedBack/commit";
}

@end
