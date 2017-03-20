//
//  UIView+BrDot.m
//  XpathDemo
//
//  Created by brant on 2017/3/17.
//  Copyright © 2017年 brant. All rights reserved.
//

#import "UIView+BrDot.h"

@implementation UIView (BrDot)

- (UIViewColorBlock)br_backgroundColor {
    return ^UIView *(UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}

- (UIViewIntegerBlock)br_tag {
    return ^UIView *(NSInteger tag) {
        self.tag = tag;
        return self;
    };
}

- (UIViewFloatBlock)br_cornerRadius {
    return ^UIView *(CGFloat cornerRadius) {
        self.layer.cornerRadius = cornerRadius;
        return self;
    };
}

- (UIViewFloatBlock)br_x {
    return ^UIView *(CGFloat x) {
        CGRect frame = self.frame;
        frame.origin.x = x;
        self.frame = frame;
        return self;
    };
}

- (UIViewFloatBlock)br_y {
    return ^UIView *(CGFloat y) {
        CGRect frame = self.frame;
        frame.origin.y = y;
        self.frame = frame;
        return self;
    };
}

- (UIViewFloatBlock)br_width {
    return ^UIView *(CGFloat width) {
        CGRect frame = self.frame;
        frame.size.width = width;
        self.frame = frame;
        return self;
    };
}

- (UIViewFloatBlock)br_height {
    return ^UIView *(CGFloat height) {
        CGRect frame = self.frame;
        frame.size.height = height;
        self.frame = frame;
        return self;
    };
}

- (UIViewPointBlock)br_center {
    return ^UIView *(CGPoint center) {
        self.center = center;
        return self;
    };
}

- (UIViewFloatBlock)br_centerX {
    return ^UIView *(CGFloat centerX) {
        CGPoint p = self.center;
        p.x = centerX;
        self.center = p;
        return self;
    };
}

- (UIViewFloatBlock)br_centerY {
    return ^UIView *(CGFloat centerY) {
        CGPoint p = self.center;
        p.y = centerY;
        self.center = p;
        return self;
    };
}

- (UIViewFloatBlock)br_bottom {
    return ^UIView *(CGFloat bottom) {
        CGRect frame = self.frame;
        frame.origin.y = bottom - frame.size.height;
        self.frame = frame;
        return self;
    };
}

- (UIViewFloatBlock)br_right {
    return ^UIView *(CGFloat right) {
        CGRect frame = self.frame;
        frame.origin.x = right - frame.size.width;
        self.frame = frame;
        return self;
    };
}

- (UIViewBoolBlock)br_masksToBounds {
    return ^UIView *(BOOL masksToBounds) {
        self.layer.masksToBounds = masksToBounds;
        return self;
    };
}

- (UIViewFloatBlock)br_borderWidth {
    return ^UIView *(CGFloat borderWidth) {
        self.layer.borderWidth = borderWidth;
        return self;
    };
}

- (UIViewColorBlock)br_borderColor {
    return ^UIView *(UIColor *borderColor) {
        self.layer.borderColor = borderColor.CGColor;
        return self;
    };
}

- (UIViewBoolBlock)br_clipsToBounds {
    return ^UIView *(BOOL clipsToBounds) {
        self.clipsToBounds = clipsToBounds;
        return self;
    };
}

- (UIViewFloatBlock)br_alpha {
    return ^UIView *(CGFloat alpha) {
        self.alpha = alpha;
        return self;
    };
}

- (UIViewBoolBlock)br_opaque {
    return ^UIView *(BOOL opaque) {
        self.opaque = opaque;
        return self;
    };
}

@end
