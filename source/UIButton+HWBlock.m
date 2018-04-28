//
//  UIButton+HWBlock.m
//  MyHome
//
//  Created by LYB on 16/4/28.
//  Copyright © 2016年 LYB. All rights reserved.
//

#import "UIButton+HWBlock.h"
#import <objc/runtime.h>

@implementation UIButton (HWBlock)

- (void)setReturnBlock:(void (^)(id))returnBlock
{
    objc_setAssociatedObject(self, @selector(returnBlock), returnBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(id))returnBlock
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)addTargetUsingBlock:(void (^)(id sender))returnBlock
{
    if (self.returnBlock != returnBlock) {
        self.returnBlock = returnBlock;
    }
    [self addTarget:self action:@selector(HWClickAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)HWClickAction:(id)sender
{
    if (self.returnBlock) {
        self.returnBlock(sender);
    }
}

@end
