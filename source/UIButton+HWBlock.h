//
//  UIButton+HWBlock.h
//  MyHome
//
//  Created by LYB on 16/4/28.
//  Copyright © 2016年 LYB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIButton (HWBlock)

@property (nonatomic ,copy) void (^returnBlock) (id sender);

/**UIButtonBLock方法*/
- (void)addTargetUsingBlock:(void (^)(id sender))returnBlock;

@end
