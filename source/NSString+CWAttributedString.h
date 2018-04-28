//
//  NSString+CWAttributedString.h
//  DhjtUmsMpos-CWCustom
//
//  Created by LYB on 16/5/19.
//  Copyright © 2016年 LYB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CWAttributedString)

/**
 *  转换成attribute属性
 */
- (NSAttributedString *)getAttributeWith:(id)sender
                               orginFont:(CGFloat)orginFont
                              orginColor:(UIColor *)orginColor
                           attributeFont:(CGFloat)attributeFont
                          attributeColor:(UIColor *)attributeColor;

@end
