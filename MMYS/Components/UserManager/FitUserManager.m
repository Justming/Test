//
//  FitUserManager.m
//  FitTrainer
//
//  Created by Huasheng on 15/8/20.
//  Copyright (c) 2015年 Huasheng. All rights reserved.
//

#import "FitUserManager.h"
#import "HTTPProxy.h"

#define ENCODE_KEY          @"Fit_UserManager"

static FitUserManager *__sharedUserManager;
static NSString *const __kUserInfoFileName = @"B911B8BD1CCD76D0";
static NSString *const __kPasswordInfoFileName = @"C2BC1692D60AAC29";

@interface FitUserManager (/* 私有方法 */)

- (NSString *)userFileFullPath;
- (NSString *)pswFileFullPath;
- (NSData *)simpleEncode:(NSString *)s;
- (NSString *)simpleDecode:(NSData *)s;

@end

@implementation FitUserManager

+ (FitUserManager *)sharedUserManager
{
    if (!__sharedUserManager) {
        __sharedUserManager = [[FitUserManager alloc] init];
    }
    
    return __sharedUserManager;
}

- (BOOL)isLogin
{
    NSDictionary *info = [self userInfo];
    
    if ([[info objectForKey:@"staffID"] boolValue]) {
        if ([info objectForKey:@"staffID"] && [info objectForKey:@"password"]) {
            return YES;
        }
    } else {
        if ([info objectForKey:@"uuid"] && [info objectForKey:@"phone"] && [info objectForKey:@"password"]) {
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)logout
{
    NSDictionary    *userDict   = [[NSDictionary alloc] init];
    
    [self updateUserInfo:userDict];
    
    return YES;
}

- (BOOL)isRememberPsw
{
    NSDictionary *info = [self userInfo];
    
    if (info && [[info objectForKey:@"rememberPsw"] isEqualToString:@"true"]) {
        return YES;
    }
    
    return NO;
}

#pragma mark - Save and Get Password
- (BOOL)savePsw:(NSString *)psw
{
    NSString *path = [self pswFileFullPath];
    
    if (!psw || [psw isEqualToString:@""]) {
        NSFileManager *fm = [NSFileManager defaultManager];
        return [fm removeItemAtPath:path error:nil];
    }
    NSData *pswArchivered = [self simpleEncode:psw];
    
    return [NSKeyedArchiver archiveRootObject:pswArchivered toFile:path];
}

- (NSString *)getPsw
{
    NSString *path = [self pswFileFullPath];
    NSFileManager *fm = [NSFileManager defaultManager];
    
    if ([fm fileExistsAtPath:path]) {
        NSData *psw = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        if (psw && [psw length] > 0) {
            return [self simpleDecode:psw];
        }
    }
    return nil;
}

#pragma mark - Save and Get User Info
- (NSDictionary *)userInfo
{
    NSString *path = [self userFileFullPath];
    NSFileManager *fm = [NSFileManager defaultManager];
    
    if ([fm fileExistsAtPath:path]) {
        NSDictionary *info = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        if ([info.allKeys count] > 0) {
            return info;
        }
    }
    
    return nil;
}

- (BOOL)updateUserInfo:(NSDictionary *)userData
{
    NSString *path = [self userFileFullPath];
    
    return [NSKeyedArchiver archiveRootObject:userData toFile:path];
}

- (void)saveUserInnfo:(NSString *)value ForKey:(NSString *)key
{
    if (!value || !key) {
        return;
    }
    
    NSMutableDictionary *dict   = [NSMutableDictionary dictionaryWithDictionary:[self userInfo]];
    
    [dict setObject:value forKey:key];
    [self updateUserInfo:dict];
}

- (NSString *)userFileFullPath
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *fullPath = [path stringByAppendingPathComponent:__kUserInfoFileName];
    
    return fullPath;
}

- (NSString *)pswFileFullPath
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *fullPath = [path stringByAppendingPathComponent:__kPasswordInfoFileName];
    
    return fullPath;
}

#pragma mark - Encode and Decode
- (NSData *)simpleEncode:(NSString *)s
{
    NSData *data = [s dataUsingEncoding:NSUTF8StringEncoding];
    
    char *dataPtr = (char *)[data bytes];
    char *keyData = (char *)[[ENCODE_KEY dataUsingEncoding:NSUTF8StringEncoding] bytes];
    char *keyPtr = keyData;
    int keyIndex = 0;
    
    for (int i = 0; i < [data length]; i++) {
        *dataPtr = *dataPtr ^ *keyPtr;
        dataPtr++;
        keyPtr++;
        
        if (++keyIndex == [ENCODE_KEY length]) {
            keyIndex = 0;
            keyPtr = keyData;
        }
    }
    return data;
}

- (NSString *)simpleDecode:(NSData *)s
{
    NSData *data = [NSData dataWithData:s];
    
    char *dataPtr = (char *)[data bytes];
    char *keyData = (char *)[[ENCODE_KEY dataUsingEncoding:NSUTF8StringEncoding] bytes];
    char *keyPtr = keyData;
    int keyIndex =0;
    
    for (int i = 0; i < [data length]; i++) {
        *dataPtr = *dataPtr ^ *keyPtr;
        dataPtr++;
        keyPtr++;
        
        if (++keyIndex == [ENCODE_KEY length]) {
            keyIndex = 0;
            keyPtr = keyData;
        }
    }
    
    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return result;
}

#pragma mark Getters and Setters

- (void)setUuid:(NSString *)uuid
{
    [self saveUserInnfo:uuid ForKey:@"uuid"];
}

- (NSString *)uuid
{
    return [[self userInfo] objectForKey:@"uuid"];
}


- (void)setPassword:(NSString *)password
{
    [self saveUserInnfo:password ForKey:@"password"];
}

- (NSString *)password
{
    return [[self userInfo] objectForKey:@"password"];
}

- (void)setUsername:(NSString *)username
{
    [self saveUserInnfo:username ForKey:@"username"];
}

- (NSString *)username
{
    return [[self userInfo] objectForKey:@"username"];
}

- (void)setAvatar:(NSString *)avatar
{
    [self saveUserInnfo:avatar ForKey:@"avatar"];
}

- (NSString *)avatar
{
    return [[self userInfo] objectForKey:@"avatar"];
}

- (void)setSlogan:(NSString *)slogan
{
    [self saveUserInnfo:slogan ForKey:@"slogan"];
}

- (NSString *)slogan
{
    return [[self userInfo] objectForKey:@"slogan"];
}

- (void)setPhone:(NSString *)phone
{
    [self saveUserInnfo:phone ForKey:@"phone"];
}

- (NSString *)phone
{
    return [[self userInfo] objectForKey:@"phone"];
}


- (void)setAge:(NSString *)age
{
    [self saveUserInnfo:age ForKey:@"age"];
}

- (NSString *)age
{
    return [[self userInfo] objectForKey:@"age"];
}

- (void)setGender:(NSString *)gender
{
    [self saveUserInnfo:gender ForKey:@"gender"];
}

- (NSString *)gender
{
    return [[self userInfo] objectForKey:@"gender"];
}

- (void)setBirthday:(NSString *)birthday
{
    [self saveUserInnfo:birthday ForKey:@"birthday"];
}

- (NSString *)birthday
{
    return [[self userInfo] objectForKey:@"birthday"];
}


//- (void)setBalance:(NSString *)balance {
//    [self saveUserInnfo:balance ForKey:@"balance"];
//}
//
//- (NSString *)balance {
//    return [[self userInfo] objectForKey:@"balance"];
//}

- (void)setTokenMoney:(NSString *)tokenMoney
{
    [self saveUserInnfo:tokenMoney ForKey:@"tokenMoney"];
}

- (NSString *)tokenMoney
{
    return [[self userInfo] objectForKey:@"tokenMoney"];
}

- (void)setContact:(NSString *)contact
{
    [self saveUserInnfo:contact ForKey:@"contact"];
}

- (NSString *)contact
{
    return [[self userInfo] objectForKey:@"contact"];
}

- (void)setAddress:(NSString *)address
{
    [self saveUserInnfo:address ForKey:@"address"];
}

- (NSString *)address
{
    return [[self userInfo] objectForKey:@"address"];
}

- (void)setFirm:(NSString *)firm
{
    [self saveUserInnfo:firm ForKey:@"firm"];
}

- (NSString *)firm
{
    return [[self userInfo] objectForKey:@"firm"];
}

- (void)setstaffID:(NSString *)staffID
{
    [self saveUserInnfo:staffID ForKey:@"staffID"];
}

- (NSString *)staffID
{
    return [[self userInfo] objectForKey:@"staffID"];
}

- (void)setemp_uuid:(NSString *)emp_uuid
{
    [self saveUserInnfo:emp_uuid ForKey:@"emp_uuid"];
}

- (NSString *)emp_uuid
{
    return [[self userInfo] objectForKey:@"emp_uuid"];
}

//商户姓名
- (void)setmerchant_name:(NSString *)merchant_name
{
    [self saveUserInnfo:merchant_name ForKey:@"merchant_name"];
}

- (NSString *)merchant_name
{
    return [[self userInfo] objectForKey:@"merchant_name"];
}

//商户余额
- (void)setbalance:(NSString *)balance
{
    [self saveUserInnfo:balance ForKey:@"balance"];
}

- (NSString *)balance
{
    return [[self userInfo] objectForKey:@"balance"];
}

//商户积分
- (void)setintegral:(NSString *)integral
{
    [self saveUserInnfo:integral ForKey:@"integral"];
}

- (NSString *)integral
{
    return [[self userInfo] objectForKey:@"integral"];
}

//提现密码
- (void)sethasCashPswd:(NSString *)hasCashPswd
{
    [self saveUserInnfo:hasCashPswd ForKey:@"hasCashPswd"];
}

- (NSString *)hasCashPswd
{
    return [[self userInfo] objectForKey:@"hasCashPswd"];
}

//合伙人手机号
- (void)setpartnerPhone:(NSString *)partnerPhone
{
    [self saveUserInnfo:partnerPhone ForKey:@"partnerPhone"];
}

- (NSString *)partnerPhone
{
    return [[self userInfo] objectForKey:@"partnerPhone"];
}

//商户认证情况
- (void)setmerchant_status:(NSString *)merchant_status
{
    [self saveUserInnfo:merchant_status ForKey:@"merchant_status"];
}

- (NSString *)merchant_status
{
    return [[self userInfo] objectForKey:@"merchant_status"];
}



@end
