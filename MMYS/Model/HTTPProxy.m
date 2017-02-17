
//
//  HTTPProxy.m
//  FitTrainer
//
//  Created by Huasheng on 15/8/20.
//  Copyright (c) 2015年 Huasheng. All rights reserved.
//

#import "HTTPProxy.h"
#import "FitSignalCacheManager.h"

@implementation HTTPProxy

+ (HTTPProxy *)loadWithRequest:(FitBaseRequest *)request
                     completed:(RequestCompletedHandleBlock)completeHandleBlock
                        failed:(RequestFailedHandleBlock)failedHandleBlock
{
    return [HTTPProxy loadWithRequest:request
                        keyGenerator:nil
                         cacheEnough:NO
                           completed:^(NSString* resp, BOOL cache, NSStringEncoding encoding){
                               completeHandleBlock(resp, encoding);
                           }
                              failed:failedHandleBlock];

}



+ (HTTPProxy *)loadWithRequest:(FitBaseRequest *)request
                 keyGenerator:(id<CacheKeyGenerator>)keyGenerator
                  cacheEnough:(BOOL)cacheEnough
                    completed:(RequestCachableCompletedHandleBlock)completeHandleBlock
                       failed:(RequestFailedHandleBlock)failedHandleBlock
{
    HTTPProxy *proxy = [[HTTPProxy alloc] init];
    NSURLRequest *urlReq = [request req];
    
    NSString* cacheKey = [keyGenerator genCacheKey: request];
    if (cacheKey) {
        NSLog(@"HCBProxy----looking up Cache for key:'%@'", cacheKey);
        NSString* cache = [[FitSignalCacheManager sharedManager] queryDataFor:cacheKey];
        if (cache) {
            if (completeHandleBlock) {
                completeHandleBlock(cache, YES, NSUTF8StringEncoding);
            }
            NSLog(@"HCBProxy----Got Cache.");
            if (cacheEnough) {
                NSLog(@"HCBProxy----Cache Enough, no need send network request.");
                return proxy;
            }
        }
        NSLog(@"HCBProxy----No Cache. sending request to network...");
    }
    
    proxy.oper = [[AFHTTPRequestOperation alloc] initWithRequest:urlReq];
    [proxy.oper setSuccessCallbackQueue:(dispatch_get_global_queue(0, 0))];
    [proxy.oper setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //        NSString *RESULT = [operation responseString];
        
        if (completeHandleBlock) {
            completeHandleBlock([operation responseString], NO, [operation responseStringEncoding]);
            
            if (cacheKey) {
                NSLog(@"HCBProxy----Saving response to Cache.");
                [[FitSignalCacheManager sharedManager] saveCache:[operation responseString]
                                                           forKey:cacheKey];
            }
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"==================================================");
        NSLog(@"加载数据失败，Error: %@", [error localizedDescription]);
        NSLog(@"Class:::%@", NSStringFromClass([self class]));
        NSLog(@"==================================================");
        
        if (failedHandleBlock) {
            failedHandleBlock(error);
        }
    }];
    
    return proxy;
}


- (void)start
{
    if (_oper && _oper.isReady) {
        [_oper start];
    }
}

- (BOOL)isLoading
{
    _loading = [_oper isExecuting];
    return _loading;
}

- (BOOL)isLoaded
{
    _loaded = [_oper isFinished];
    return _loaded;
}

@end
