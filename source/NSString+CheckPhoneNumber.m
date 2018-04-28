
//
//  NSString+CheckPhoneNumber.m
//  MySends
//
//  Created by LYB on 16/4/21.
//  Copyright © 2016年 王恺. All rights reserved.
//

#import "NSString+CheckPhoneNumber.h"

@implementation NSString (CheckPhoneNumber)

-(BOOL)checkPhoneNumInput{
    
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     */
    
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    
    /**
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186
     */
    
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,189,177
     */
    
    NSString * CT = @"^1((33|53|8[09]|7[0-9]|99)[0-9]|349)\\d{7}$";
    
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    
//     NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSString *PHS = @"^((00852|00853|0([1-7]|9)\\d{2}|08[1-9][0-9]|080\\d{2}|0(10|2[0-9]))-?\\d{7,8})$";
    
    /**
     *  特殊电话
     *  支持如下类型号码
     *  010
     *  110
     *  120
     *  
     */
//    NSString *DH = @"^(\\d{3})$";
    
    /**
     *  通用手机号（不区分的那么仔细）100~199开头
     */
    NSString *TY = @"^1([0-9][0-9])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
//    NSPredicate *regextestdh = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",DH];
     NSPredicate *regextestty = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",TY];
    
    BOOL res1 = [regextestmobile evaluateWithObject:self];
    BOOL res2 = [regextestcm evaluateWithObject:self];
    BOOL res3 = [regextestcu evaluateWithObject:self];
    BOOL res4 = [regextestct evaluateWithObject:self];
//    BOOL res5 = [regextestdh evaluateWithObject:self];
    BOOL res6 = [regextestphs evaluateWithObject:self];
    BOOL res7 = [regextestty evaluateWithObject:self];
    
    if (res1 || res2 || res3 || res4 || res6 || res7){
        return YES;
    }
//    if (res6 || res7) {
//        return YES;
//    }
    else {
        return NO;
    }
}

- (AreaCodeType)CheckAreaCode
{
    NSString *ProStr = @"^0(10|2[0-9])$";
    NSPredicate *regextestPro = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", ProStr];
    BOOL res1 = [regextestPro evaluateWithObject:self];
    
    NSString *CityStr = @"^(00852|00853|0([1-7]|9)\\d{2}|08[1-9][0-9]|080\\d{2})$";
    NSPredicate *regextestCity = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CityStr];
    BOOL res2 = [regextestCity evaluateWithObject:self];
    if (res1) {
        return AreaCodeTypeForProvince;
    }else if (res2) {
        return AreaCodeTypeForCity;
    }else{
        return AreaCodeTypeForNone;
    }
}



@end
