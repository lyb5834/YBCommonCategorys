//
//  NSString+XGBCheckValues.h
//  UMSMySends
//
//  Created by LYB on 16/6/2.
//  Copyright © 2016年 chinaums. All rights reserved.
//

#import <Foundation/Foundation.h>

//判断字符串中是否包含电话号码等
@interface NSString (XGBCheckValues)

/**判断字符串中是否包含电话号码*/
- (NSArray *)isStringContainsPhoneNumber;

/**判断用户密码是否合法*/
- (BOOL)isUserPassWordLegal;

/**
 是否是网址
 */
- (BOOL)isUrlAddress;

@end
