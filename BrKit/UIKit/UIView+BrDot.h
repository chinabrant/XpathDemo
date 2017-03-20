//
//  UIView+BrDot.h
//  XpathDemo
//
//  Created by brant on 2017/3/17.
//  Copyright © 2017年 brant. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIView *(^UIViewColorBlock) (UIColor *);
typedef UIView *(^UIViewIntegerBlock) (NSInteger);
typedef UIView *(^UIViewFloatBlock) (CGFloat);
typedef UIView *(^UIViewPointBlock) (CGPoint);
typedef UIView *(^UIViewBoolBlock) (BOOL);

@interface UIView (BrDot)


- (UIViewColorBlock)br_backgroundColor;

- (UIViewIntegerBlock)br_tag;

- (UIViewFloatBlock)br_cornerRadius;

- (UIViewFloatBlock)br_x;

- (UIViewFloatBlock)br_y;

- (UIViewFloatBlock)br_width;

- (UIViewFloatBlock)br_height;

- (UIViewPointBlock)br_center;

- (UIViewFloatBlock)br_centerX;

- (UIViewFloatBlock)br_centerY;

- (UIViewFloatBlock)br_bottom;

- (UIViewFloatBlock)br_right;

- (UIViewBoolBlock)br_masksToBounds;

- (UIViewFloatBlock)br_borderWidth;

- (UIViewColorBlock)br_borderColor;

- (UIViewBoolBlock)br_clipsToBounds;

- (UIViewFloatBlock)br_alpha;

- (UIViewBoolBlock)br_opaque;

@end
