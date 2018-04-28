//
//  UITextView+YBlimit.h
//
//  Created by lyb on 2018/2/24.
//  Copyright © 2018年 lyb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (YBlimit)

- (void)yb_limitTextMaxLength:(NSInteger)maxLength isOutOfLength:(void (^) (UITextView * textView))isOutOfLengthHandle;

@end
