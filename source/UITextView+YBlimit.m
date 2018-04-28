//
//  UITextView+YBlimit.m
//
//  Created by lyb on 2018/2/24.
//  Copyright © 2018年 lyb. All rights reserved.
//

#import "UITextView+YBlimit.h"
#import <objc/runtime.h>

@implementation UITextView (YBlimit)

- (void)setLimitHandle:(void (^)(UITextView *))limitHandle
{
    objc_setAssociatedObject(self, @selector(limitHandle), limitHandle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UITextView *))limitHandle
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setMaxLength:(NSInteger)maxLength
{
    objc_setAssociatedObject(self, @selector(maxLength), @(maxLength), OBJC_ASSOCIATION_ASSIGN);
}

- (NSInteger)maxLength
{
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)yb_limitTextMaxLength:(NSInteger)maxLength isOutOfLength:(void (^)(UITextView *))isOutOfLengthHandle
{
    self.limitHandle = isOutOfLengthHandle;
    self.maxLength = maxLength;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(yb_textViewTextDidChange:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)yb_textViewTextDidChange:(NSNotification *)notify
{
    NSInteger kMaxLength = self.maxLength;
    NSString *toBeString = self.text;
    NSString *lang = [[UIApplication sharedApplication] textInputMode].primaryLanguage; //ios7之前使用[UITextInputMode currentInputMode].primaryLanguage
    if ([lang isEqualToString:@"zh-Hans"]) { //中文输入
        UITextRange *selectedRange = [self markedTextRange];
        //获取高亮部分
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        if (!position) {// 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (toBeString.length > kMaxLength) {
                self.text = [toBeString substringToIndex:kMaxLength];
                if (self.limitHandle) {
                    self.limitHandle(self);
                }
            }
        }
        else{//有高亮选择的字符串，则暂不对文字进行统计和限制
        }
    }else{//中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (toBeString.length > kMaxLength) {
            self.text = [toBeString substringToIndex:kMaxLength];
            if (self.limitHandle) {
                self.limitHandle(self);
            }
        }
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:nil];
}

@end
