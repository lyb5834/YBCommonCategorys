//
//  UIImage+YBScale.h
//  UmsYesRunnerPluginProject
//
//  Created by LYB on 17/2/20.
//  Copyright © 2017年 LYB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YBScale)

/**定制图片大小，像素不变*/
- (UIImage*)yb_scaleToSize:(CGSize)size;

/**
 压缩图片至指定大小
 */
- (UIImage *)yb_imageScaleToKb:(NSInteger)kb;

/**
 压缩图片至指定大小
 */
- (UIImage *)yb_imageScaleToKb:(NSInteger)kb
                    imageBlock:(void(^)(UIImage *image))block;

/**
 图片切圆角
 */
- (UIImage*)yb_imageWithCornerRadius:(CGFloat)radius;

/**
 图片截图
 */
+ (UIImage *)yb_screenShotWithView:(UIView *)view;

/**
 屏幕截图带区域
 */
+ (UIImage *)yb_screenShotWithView:(UIView *)view screenShootSize:(CGSize)size;

@end
