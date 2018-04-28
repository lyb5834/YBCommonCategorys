//
//  UIView+YBGestureRecognizer.m
//  MyHome
//
//  Created by LYB on 16/5/4.
//  Copyright © 2016年 LYB. All rights reserved.
//

#import "UIView+YBGestureRecognizer.h"
#import <objc/runtime.h>

@implementation UIView (YBGestureRecognizer)

- (void)addYBTapGestureReconizerUsingBlock:(void (^) (UITapGestureRecognizer *tgr))returnBlock
{
    if (self.returnBlock != returnBlock) {
        self.returnBlock = returnBlock;
    }
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *gtr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(yb_tapAction:)];
    [self addGestureRecognizer:gtr];
}

- (void)yb_tapAction:(UITapGestureRecognizer *)tgr
{
    if (self.returnBlock) {
        self.returnBlock(tgr);
    }
}

- (void)setReturnBlock:(void (^)(UITapGestureRecognizer *tgr))returnBlock
{
    objc_setAssociatedObject(self, @selector(returnBlock), returnBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UITapGestureRecognizer *tgr))returnBlock
{
    return objc_getAssociatedObject(self, _cmd);
}

@end
