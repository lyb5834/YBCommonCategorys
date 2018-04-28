//
//  NSString+XGBCheckValues.m
//  UMSMySends
//
//  Created by LYB on 16/6/2.
//  Copyright © 2016年 chinaums. All rights reserved.
//

#import "NSString+XGBCheckValues.h"

@implementation NSString (XGBCheckValues)

- (NSArray *)isStringContainsPhoneNumber
{
    NSError *error;
    //通用手机号
    NSString *TY = @"1([0-9][0-9])\\d{8}";
    //大陆地区固话及小灵通
    NSString *PHS = @"(((00852|00853|0([1-7]|9)\\d{2}|08[1-9][0-9]|080\\d{2}|0(10|2[0-9]))-?\\d{7,8})|(1[3584]\\d{9}))";
    
    NSRegularExpression *regexTY = [NSRegularExpression
                                    regularExpressionWithPattern:TY
                                    options:NSRegularExpressionCaseInsensitive
                                    error:&error];
    
    NSArray *arrayOfAllMatchesTY = [regexTY matchesInString:self options:0 range:NSMakeRange(0, [self length])];
    
    NSRegularExpression *regexPHS = [NSRegularExpression
                                    regularExpressionWithPattern:PHS
                                    options:NSRegularExpressionCaseInsensitive
                                    error:&error];
    
    NSArray *arrayOfAllMatchesPHS = [regexPHS matchesInString:self options:0 range:NSMakeRange(0, [self length])];
    
    NSMutableArray *resultArray = [NSMutableArray array];
    
    for (NSTextCheckingResult *match in arrayOfAllMatchesTY) {
        NSString *str = [self substringWithRange:match.range];
        [resultArray addObject:str];
    }
    
    for (NSTextCheckingResult *match in arrayOfAllMatchesPHS) {
        NSString *str = [self substringWithRange:match.range];
        [resultArray addObject:str];
    }
    
    //过滤重复的
    NSMutableArray *strArray = [NSMutableArray array];
    for (int i = 0; i < resultArray.count; i++) {
        if (![strArray containsObject:resultArray[i]]) {
            [strArray addObject:resultArray[i]];
        }
    }
    
    return strArray;
}

- (BOOL)isUserPassWordLegal
{
    NSString *regularStr = @"^(?![A-Za-z]+$)(?![A-Z\\d]+$)(?![A-Z\\W]+$)(?![a-z\\d]+$)(?![a-z\\W]+$)(?![\\d\\W]+$)\\S{8,20}$";
    NSPredicate *redicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regularStr];
    return [redicate evaluateWithObject:self];
}

- (BOOL)isUrlAddress
{
    NSString * regulaStr = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    
    NSPredicate *urlPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regulaStr];
    return [urlPredicate evaluateWithObject:self];
}

@end
