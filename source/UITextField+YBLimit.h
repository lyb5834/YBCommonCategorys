//
//  UITextField+YBLimit.h
//
//  Created by lyb on 2018/2/24.
//  Copyright © 2018年 lyb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (YBLimit)

- (void)yb_limitTextMaxLength:(NSInteger)maxLength isOutOfLength:(void (^) (UITextField * textField))isOutOfLengthHandle;

@end
