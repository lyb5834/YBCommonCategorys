//
//  UIView+YBGestureRecognizer.h
//  MyHome
//
//  Created by LYB on 16/5/4.
//  Copyright © 2016年 LYB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (YBGestureRecognizer)

@property (nonatomic ,copy) void (^returnBlock) (UITapGestureRecognizer * tgr);

/**增加手势并回调*/
- (void)addYBTapGestureReconizerUsingBlock:(void (^) (UITapGestureRecognizer *tgr))returnBlock;

@end
