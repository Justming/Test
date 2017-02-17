//
//  APApproveRequest.m
//  apparel
//
//  Created by JamHonyZ on 16/8/10.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "APApproveRequest.h"

@implementation APApproveRequest

- (id)initWithmerchantName:(NSString *)merchant_name
                 andGender:(NSString *)gender
                 andIdCard:(NSString *)id_card
      andUploadPhotoIdCard:(NSString *)upload_photo_id_card
              andStoreName:(NSString *)store_name
           andStoreAddress:(NSString *)store_address
         andAddressDetails:(NSString *)address_details
       andUploadStorePhoto:(NSArray *)upload_store_photo
 andUploadBussinessLicense:(NSString *)upload_bussiness_license
               andCategory:(NSArray *)category

{
    self = [super init];
    if (self) {
        
        NSMutableDictionary     *bodyDict   = [NSMutableDictionary new];
        
        if (merchant_name && [merchant_name isKindOfClass:[NSString class]]) {
            
            [bodyDict setObject:merchant_name forKey:@"merchant_name"];
        }
        
        if (gender && [gender isKindOfClass:[NSString class]]) {
            [bodyDict setObject:gender forKey:@"gender"];
        }
        
        if (id_card && [id_card isKindOfClass:[NSString class]]) {
            [bodyDict setObject:id_card forKey:@"id_card"];
        }
        
        if (upload_photo_id_card && [upload_photo_id_card isKindOfClass:[NSString class]]) {
            [bodyDict setObject:upload_photo_id_card forKey:@"upload_photo_id_card"];
        }
        
        
        if (store_name && [store_name isKindOfClass:[NSString class]]) {
            
            [bodyDict setObject:store_name forKey:@"store_name"];
        }
        
        if (store_address && [store_address isKindOfClass:[NSString class]]) {
            [bodyDict setObject:store_address forKey:@"store_address"];
        }
        
        if (address_details && [address_details isKindOfClass:[NSString class]]) {
            [bodyDict setObject:address_details forKey:@"address_details"];
        }
        
        if (upload_store_photo) {
            [bodyDict setObject:upload_store_photo forKey:@"upload_store_photo"];
        }

        if (upload_bussiness_license && [upload_bussiness_license isKindOfClass:[NSString class]]) {
            [bodyDict setObject:upload_bussiness_license forKey:@"upload_bussiness_license"];
        }
        if (category) {
            [bodyDict setObject:category forKey:@"category"];
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
    return @"user/approval";//申请认证
}


@end
