
//
//  NSString+CheckPhoneNumber.h
//  MySends
//
//  Created by LYB on 16/4/21.
//  Copyright © 2016年 王恺. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  区号类型
 */
typedef NS_ENUM(NSInteger,AreaCodeType) {
    /**
     *  省（010，020。。）
     */
    AreaCodeTypeForProvince = 0,
    /**
     *  市（0513，0514。。）
     */
    AreaCodeTypeForCity,
    /**
     *  不匹配
     */
    AreaCodeTypeForNone
};

@interface NSString (CheckPhoneNumber)


/**
 *  检测手机和固话号码是否合法
 */
- (BOOL)checkPhoneNumInput;

/**检测区号信息*/
- (AreaCodeType)CheckAreaCode;

@end
