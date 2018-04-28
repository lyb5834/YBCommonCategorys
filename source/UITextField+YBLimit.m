//
//  UITextField+YBLimit.m
//
//  Created by lyb on 2018/2/24.
//  Copyright © 2018年 lyb. All rights reserved.
//

#import "UITextField+YBLimit.h"
#import <objc/runtime.h>

@implementation UITextField (YBLimit)

- (void)setLimitHandle:(void (^)(UITextField *))limitHandle
{
    objc_setAssociatedObject(self, @selector(limitHandle), limitHandle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UITextField *))limitHandle
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

- (void)yb_limitTextMaxLength:(NSInteger)maxLength isOutOfLength:(void (^)(UITextField *))isOutOfLengthHandle
{
    self.limitHandle = isOutOfLengthHandle;
    self.maxLength = maxLength;
    [self addTarget:self action:@selector(yb_textFieldEditChanged:) forControlEvents:UIControlEventEditingChanged];
}

- (void)yb_textFieldEditChanged:(UITextField *)textField
{
    NSInteger kMaxLength = self.maxLength;
    NSString *toBeString = textField.text;
    NSString *lang = [[UIApplication sharedApplication] textInputMode].primaryLanguage; //ios7之前使用[UITextInputMode currentInputMode].primaryLanguage
    if ([lang isEqualToString:@"zh-Hans"]) { //中文输入
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        if (!position) {// 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (toBeString.length > kMaxLength) {
                textField.text = [toBeString substringToIndex:kMaxLength];
                if (self.limitHandle) {
                    self.limitHandle(self);
                }
            }
        }
        else{//有高亮选择的字符串，则暂不对文字进行统计和限制
        }
    }else{//中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        if (toBeString.length > kMaxLength) {
            textField.text = [toBeString substringToIndex:kMaxLength];
            if (self.limitHandle) {
                self.limitHandle(self);
            }
        }
    }
}

@end
