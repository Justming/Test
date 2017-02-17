//
//  FitBaseRequest.m
//  FitTrainer
//
//  Created by Huasheng on 15/8/21.
//  Copyright (c) 2015年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"
#import "FitUserManager.h"
#import "FitClientIDManager.h"
#import <AFNetworking/AFNetworking.h>

@interface FitBaseRequest ()

- (NSData *)toJSONData:(id)theData;

@end

@implementation FitBaseRequest

@synthesize params          =       _params;
@synthesize imageData       =       _imageData;
@synthesize imageName       =       _imageName;

- (id)initWithNone
{
    NSMutableDictionary *bodyParams = [NSMutableDictionary dictionaryWithCapacity:0];
    NSMutableDictionary *paramsDict = [self params];
    [paramsDict setObject:bodyParams forKey:@"body"];
    
    return self;
}

- (NSString *)serverHost
{
    return @"http://121.41.21.136:8070/";
    //测试
	//return @"http://120.26.137.44/apparel/";
//   return @"http://120.26.120.57:8080/apparel/";
}

- (NSString *)methodPath
{
    return nil;
}

- (NSDictionary *)query
{
    NSMutableDictionary *headParams = [NSMutableDictionary new];
    
    if ([[FitUserManager sharedUserManager] isLogin]) {
        NSString *merchantUuid          = [[FitUserManager sharedUserManager] uuid];
        NSString *password      = [[FitUserManager sharedUserManager] password];
        
        if (merchantUuid) {
            [headParams setObject:merchantUuid forKey:@"merchant_uuid"];
        }
        
        if (password) {
            [headParams setObject:password forKey:@"password"];
        }
    }
    
    if ([[FitClientIDManager sharedClientIDManager] hasClientID]) {
        NSString *cid = [[FitClientIDManager sharedClientIDManager] getClientID];
        
        if (cid && ![cid isEqualToString:@""]) {
            [headParams setObject:cid forKey:@"cid"];
        }
    }
    
    NSString    *fitVersion     = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString*)kCFBundleVersionKey];
    [headParams setObject:fitVersion forKey:@"app_version"];
    
    [headParams setObject:@"IOS" forKey:@"app_os"];
    
    NSUserDefaults  *Defaults   = [NSUserDefaults standardUserDefaults];
    
    if ([Defaults objectForKey:@"deviceToken"]) {
        
        [headParams setObject:[Defaults objectForKey:@"deviceToken"] forKey:@"devicetoken"];
    }
    
    NSMutableDictionary *paramsDict = [self params];
    [paramsDict setObject:headParams forKey:@"head"];
    
    return _params;
}

- (BOOL)isPrivate
{
    return YES;
}

- (BOOL)isImageInclude
{
    return NO;
}

- (BOOL)isPost
{
    return NO;
}



- (NSMutableDictionary *)params
{
    if (nil == _params) {
        _params = [NSMutableDictionary dictionaryWithCapacity:2];
    }
    return _params;
}

- (NSURLRequest *)req
{
    NSURL *url = [NSURL URLWithString:[self serverHost]];
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    httpClient.parameterEncoding    = AFFormURLParameterEncoding;
    
    NSMutableURLRequest *afRequest;
    
    if ([self isPost]) {
        
        if (![self isImageInclude]) {
            
            afRequest   = [httpClient requestWithMethod:@"POST"
                                                   path:[self methodPath]
                                             parameters:[NSDictionary dictionaryWithObject:[[NSString alloc] initWithData:[self toJSONData:[self query]]
                                                                                                                 encoding:NSUTF8StringEncoding]
                                                                                    forKey:@"json_package"]];
            
        }else{
            
            afRequest = [httpClient multipartFormRequestWithMethod:@"POST"
                                                              path:[self methodPath]
                                                        parameters:nil
                                         constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                             
                                             [formData appendPartWithFormData:[self toJSONData:[self query]]
                                                                         name:@"json_package"];
                                             
                                             if ([self isImageInclude] && _imageData) {
                                                 [formData appendPartWithFileData:_imageData
                                                                             name:_imageName
                                                                         fileName:[NSString stringWithFormat:@"%@.jpg", _imageName]
                                                                         mimeType:@"image/jpeg"];
                                             }
                                             
                                         }];
            
        }

    } else {
        
        afRequest = [httpClient requestWithMethod:@"GET"
                                             path:[self methodPath]
                                       parameters:nil];
    }
    
    return afRequest;
}


- (NSData *)toJSONData:(id)theData
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if ([jsonData length] > 0 && error == nil) {
        return jsonData;
    } else {
        return nil;
    }
}

@end
