//
//  APApproveRequest.h
//  apparel
//
//  Created by JamHonyZ on 16/8/10.
//  Copyright © 2016年 Huasheng. All rights reserved.
//

#import "FitBaseRequest.h"

@interface APApproveRequest : FitBaseRequest

- (id)initWithmerchantName:(NSString *)merchant_name
                 andGender:(NSString *)gender
                 andIdCard:(NSString *)id_card
      andUploadPhotoIdCard:(NSString *)upload_photo_id_card
              andStoreName:(NSString *)store_name
           andStoreAddress:(NSString *)store_address
         andAddressDetails:(NSString *)address_details
       andUploadStorePhoto:(NSArray *)upload_store_photo
 andUploadBussinessLicense:(NSString *)upload_bussiness_license
               andCategory:(NSArray *)category;

@end
